set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'w0rp/ale' " run LINT on my code as we go
Plugin 'junegunn/fzf' " fuzzy search
Plugin 'junegunn/fzf.vim'
Plugin 'itchyny/lightline.vim' " statusline
Plugin 'scrooloose/nerdtree' " file tree on left
Plugin 'Xuyuanp/nerdtree-git-plugin' " show git status in Nerdtree
Plugin 'chr4/nginx.vim' " syntax highlighting for nginx
Plugin 'powerline/powerline'
" Plugin 'godlygeek/tabular' " required for vim-markdown
Plugin 'csexton/trailertrash.vim' " highlight trailing whitespace
Plugin 'airblade/vim-gitgutter' " git status indicators
Plugin 'pangloss/vim-javascript' " syntax highlighting for javascript
" Plugin 'plasticboy/vim-markdown' " syntax highlighting and commands for markdown
Plugin 'terryma/vim-multiple-cursors' " please let me use multiple cursors again
" Plugin 'reedes/vim-pencil'
Plugin 'vim-ruby/vim-ruby'
" Plugin 'tpope/vim-surround'

call vundle#end()

filetype plugin indent on
