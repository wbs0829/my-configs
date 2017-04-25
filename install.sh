#/bin/sh

filepath=$(cd "$(dirname "$0")"; pwd)

TMUX_CONFIG_PATH=~/.tmux.conf
TMUX_PM_PATH=~/.tmux/plugins/tpm
VIM_CONFIG_PATH=~/.vimrc
VIM_PM_PATH=~/.vim/autoload/plug.vim
ZSH_CONFIG_PATH=~/.zshrc
OM_ZSH_PATH=~/.oh-my-zsh
GRC_CONFIG_PATH=~/.grc
YCM_CONFIG_PATH=~/.ycm_extra_conf.py

function show_help() {
    echo "$0 [-atTvVzZgyh]
    -a install all configs and download plugin managers
    -t install tmux config
    -T download tmux plugin manager
    -v install vim config
    -V download vim plugin manager
    -z install zsh config
    -Z download oh-my-zsh
    -g install grc config
    -y install ycm config
    -h show help"
}

function backup() {
    if [ $# -lt 1 ]; then
        mv "$1" "$2" && echo "move $1 to $2"
    else
        mv "$1" "$1.bak" && echo "move $1 to $1.bak"
    fi
}

function install_tmux_config() {
    echo "source $filepath/tmux.conf" > $TMUX_CONFIG_PATH
}

function backup_tmux_config() {
    backup $TMUX_CONFIG_PATH
}

function install_tmux_plugin_manager() {
    git clone https://github.com/tmux-plugins/tpm $TMUX_PM_PATH
}

function install_vim_config() {
    echo "source $filepath/vimrc" > $VIM_CONFIG_PATH
}

function backup_vim_config() {
    backup $VIM_CONFIG_PATH
}

function install_vim_plugin_manager() {
    curl -fLo $VIM_PM_PATH --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function install_zsh_config() {
    echo "source $filepath/zshrc" > $ZSH_CONFIG_PATH
}

function backup_zsh_config() {
    backup $ZSH_CONFIG_PATH
}

function install_om_zsh() {
    echo "After oh-my-zsh is installed, zsh will run. You should exit zsh first to continue installation."
    export ZSH="$OM_ZSH_PATH"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

function install_om_zsh_custom() {
    mkdir -p $OM_ZSH_PATH/themes
    ln -s $filepath/oh-my-zsh/themes/amber.zsh-theme $OM_ZSH_PATH/themes/amber.zsh-theme
}

function install_grc_config() {
    mkdir -p $GRC_CONFIG_PATH
    ln -s $filepath/grc/conf.sdcv $GRC_CONFIG_PATH/conf.sdcv
}

function install_ycm_config() {
    ln -s $filepath/ycm_extra_conf.py $YCM_CONFIG_PATH
}

function backup_ycm_config() {
    backup $YCM_CONFIG_PATH
}

function get_answer() {
    if [ $# -gt 2 ]; then
        local default_choice="$2"
    else
        local default_choice="y"
    fi

    while true; do
        read -p "$1" yn
        [ "x$yn" = "x" ] && yn=$default_choice
        case $yn in
            [Yy])
                return 0;;
            [Nn])
                return 1;;
            *)
                echo "Unknown choice $yn";;
        esac
    done
}

# default arguments: interactive mode
if [ $# -eq 0 ]; then
    if get_answer "Do you install tmux config?[Yn]"; then
        [ -f $TMUX_CONFIG_PATH ] && \
            get_answer "$TMUX_CONFIG_PATH exists. Do you backup it?[Yn]" && \
                backup_tmux_config
        install_tmux_config
        get_answer "Do you install tpm(tmux plugin manager)?[Yn]" && \
            install_tmux_plugin_manager
    fi

    if get_answer "Do you install vim config?[Yn]"; then
        [ -f $VIM_CONFIG_PATH ] && \
            get_answer "$VIM_CONFIG_PATH exists. Do you backup it?[Yn]" && \
                backup_vim_config
        install_vim_config
        get_answer "Do you install vim-plug(vim plugin manager)?[Yn]" && \
            install_vim_plugin_manager
    fi

    if get_answer "Do you install zsh config?[Yn]"; then
        [ -f $ZSH_CONFIG_PATH ] && \
            get_answer "$ZSH_CONFIG_PATH exists. Do you backup it?[Yn]" && \
                backup_zsh_config
        if [ ! -s $OM_ZSH_PATH ]; then
            get_answer "Do you install on-my-zsh?[Yn]" && \
                install_om_zsh && install_om_zsh_custom
        else
            get_answer "Do you install custom on-my-zsh config?[Yn]" && \
                install_om_zsh_custom
        fi
        # this must be after installing oh-my-zsh, because oh-my-zsh backups config file
        install_zsh_config
    fi

    if get_answer "Do you install grc config?[Yn]"; then
        install_grc_config
    fi

    if get_answer "Do you install YouCompleteMe config?[Yn]"; then
        [ -f $YCM_CONFIG_PATH ] && \
            get_answer "$YCM_CONFIG_PATH exists. Do you backup it?[Yn]" && \
                backup_ycm_config
        install_ycm_config
    fi

    exit 0
fi

while getopts 'atTvVzZgyh' OPT; do
    case $OPT in
        t)
            ENABLE_TMUX="y";;
        T)
            ENABLE_TMUX_PLUGIN_MANAGER="y";;
        v)
            ENABLE_VIM="y";;
        V)
            ENABLE_VIM_PLUGIN_MANAGER="y";;
        z)
            ENABLE_ZSH="y";;
        Z)
            ENABLE_OM_ZSH="y";;
        g)
            ENABLE_GRC="y";;
        y)
            ENABLE_YCM="y";;
        a)
            ENABLE_TMUX="y"
            ENABLE_TMUX_PLUGIN_MANAGER="y"
            ENABLE_VIM="y"
            ENABLE_VIM_PLUGIN_MANAGER="y"
            ENABLE_ZSH="y"
            ENABLE_OM_ZSH="y"
            ENABLE_GRC="y"
            ENABLE_YCM="y"
            ;;
        ?)
            show_help;;
    esac
done

shift $(($OPTIND - 1))

if [ "x$ENABLE_TMUX" = "xy" ]; then
    if [ -f $TMUX_CONFIG_PATH ]; then
        backup_tmux_config
    fi
    install_tmux_config
    if [ "x$ENABLE_TMUX_PLUGIN_MANAGER" = "xy" ] && [ ! -d $TMUX_PM_PATH ]; then
        install_tmux_plugin_manager
    fi
fi

if [ "x$ENABLE_VIM" = "xy" ]; then
    if [ -f $VIM_CONFIG_PATH ]; then
        backup_vim_config
    fi
    install_vim_config
    if [ "x$ENABLE_VIM_PLUGIN_MANAGER" = "xy" ] && [ ! -f $VIM_PM_PATH ]; then
        install_vim_plugin_manager
    fi
fi

if [ "x$ENABLE_ZSH" = "xy" ]; then
    if [ -f $ZSH_CONFIG_PATH ]; then
        backup_zsh_config
    fi
    if [ "x$ENABLE_OM_ZSH" = "xy" ]; then
        if [ ! -s $OM_ZSH_PATH ]; then
            install_om_zsh
        fi
        install_om_zsh_custom
    fi
    # this must be after installing oh-my-zsh, because oh-my-zsh backups config file
    install_zsh_config
fi

if [ "x$ENABLE_YCM" = "xy" ]; then
    if [ -f $YCM_CONFIG_PATH ]; then
        backup_ycm_config
    fi
    install_ycm_config
fi

if [ "x$ENABLE_GRC" = "xy" ]; then
    install_grc_config
fi
