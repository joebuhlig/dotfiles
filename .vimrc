syntax on
colorscheme ir_black

set nocompatible              " be iMproved, required
set number
set noshowmode

set tabstop=2
set shiftwidth=2
set expandtab

filetype off                  " required

so ~/.vim/plugins.vim
so ~/.vim/plugin-settings.vim
so ~/.vim/map.vim
