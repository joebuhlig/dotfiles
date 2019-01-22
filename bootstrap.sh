git -C $HOME/dotfiles pull origin master

rsync --exclude ".git/" \
	--exclude ".DS_Store" \
	--exclude ".osx" \
	--exclude "bootstrap.sh" \
	--exclude "README.md" \
	--exclude "LICENSE-MIT.txt" \
	-avh --no-perms . ~;

source ~/.bash_profile;

# install vim setup
echo 'setting up vim'
if [ -d "$HOME/.vim" ]
then
	git -C $HOME/.vim pull origin master
else
	git clone --recurse-submodules git@github.com/joebuhlig/vim.git $HOME/.vim
fi

if [ ! -L $HOME/.vimrc ]
then
	echo 'adding symlink for .vimrc'
	ln -s .vim/.vimrc $HOME/.vimrc
fi

echo 'installing plugins for vim'
vim +PluginClean +qall
vim +PluginInstall +qall

# install todo setup

echo 'setting up todo'
if [ -d "$HOME/.todo" ]
then
	git -C $HOME/.todo pull origin master
else
	git clone --recurse-submodules git@github.com/joebuhlig/todo.git $HOME/.todo
fi

chmod +x $HOME/.todo/actions/.
