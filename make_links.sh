#/bin/sh

filepath=$(cd "$(dirname "$0")"; pwd)

ln -s $filepath/.alias ~/.alias
ln -s $filepath/.function ~/.function
ln -s $filepath/.tmux.conf ~/.tmux.conf
ln -s $filepath/.vimrc ~/.vimrc
ln -s $filepath/.zshrc ~/.zshrc
ln -s $filepath/.ycm_extra_conf.py ~/.ycm_extra_conf.py
mkdir -p ~/.oh-my-zsh/themes
ln -s $filepath/.oh-my-zsh/themes/amber.zsh-theme ~/.oh-my-zsh/themes/amber.zsh-theme
mkdir -p ~/.grc
ln -s $filepath/.grc/conf.sdcv ~/.grc/conf.sdcv
