#/bin/sh

filepath=$(cd "$(dirname "$0")"; pwd)

if [ -f ~/.tmux.conf ]; then
    mv ~/.tmux.conf ~/.tmux.conf.bak
fi
echo "source $filepath/tmux.conf" > ~/.tmux.conf

if [ -f ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.bak
fi
echo "source $filepath/vimrc" > ~/.vimrc

if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.bak
fi
echo "source $filepath/zshrc" > ~/.zshrc

if [ -f ~/.ycm_extra_conf.py ]; then
    mv ~/.ycm_extra_conf.py ~/.ycm_extra_conf.py.bak
fi
ln -s $filepath/ycm_extra_conf.py ~/.ycm_extra_conf.py

mkdir -p ~/.oh-my-zsh/themes
ln -s $filepath/oh-my-zsh/themes/amber.zsh-theme ~/.oh-my-zsh/themes/amber.zsh-theme
mkdir -p ~/.grc
ln -s $filepath/grc/conf.sdcv ~/.grc/conf.sdcv
