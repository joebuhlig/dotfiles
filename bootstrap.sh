git -C $HOME/dotfiles pull origin master

rsync --exclude ".git/" \
	--exclude ".DS_Store" \
	--exclude ".osx" \
	--exclude "bootstrap.sh" \
	--exclude "README.md" \
	--exclude "LICENSE-MIT.txt" \
	-avh --no-perms . ~;

source ~/.bash_profile;

echo 'installing plugins for vim'
vim +PluginClean +qall
vim +PluginInstall +qall

# install todo setup

echo 'setting up todo'
if [ -d "$HOME/.todo" ]
then
	git -C $HOME/.todo pull origin master
else
	git clone --recurse-submodules git@github.com:joebuhlig/todo.git $HOME/.todo
fi

chmod +x $HOME/.todo/actions/.

$ install tmux setup

tmux source ~/.tmux.conf
