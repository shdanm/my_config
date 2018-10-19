#!/bin/bash

# Цвета:
RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;36m'
YELLOW='\033[1;33m'
NONE='\033[0m'
RED0='\033[0;31m'
GREEN0='\033[0;32m'
# Задаём директорию скрипта
DIRP=`pwd`
export DIRP
# Проверяем установлены ли файлы
file_list=("bashrc"
           "vimrc"
           "gitconfig"
           "tmux.conf")
for i in "${file_list[@]}"
   do
       if [ -f "$HOME/.$i" ] || [ -s "$HOME/.$i" ]; then
               rm -v $HOME/.$i
       fi
       echo -e "$GREEN создана сыллка на $i $NONE "
       ln -s $DIRP/$i $HOME/.$i 
   done
if [ ! -f "$HOME/.vim/autoload/plug.vim" ];
   then
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   else
         echo "plug.vim существует"
fi


