git -C $HOME/dotfiles pull origin master

# install vim setup
echo 'setting up vim'
if [ -d "$HOME/.vim" ]
then
	git -C $HOME/.vim pull origin master
else
	git clone --recurse-submodules https://github.com/joebuhlig/vim.git $HOME/.vim
fi

if [ ! -L $HOME/.vimrc ]
then
	echo 'adding symlink for .vimrc'
	ln -s .vim/.vimrc $HOME/.vimrc
fi

echo 'installing plugins for vim'
vim +PluginClean +qall
vim +PluginInstall +qall
