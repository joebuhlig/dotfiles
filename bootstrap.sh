git -C $HOME/dotfiles pull origin master

rsync --exclude ".git/" \
	--exclude ".gitmodules" \
	--exclude ".DS_Store" \
	--exclude ".osx" \
	--exclude "bootstrap.sh" \
	--exclude "install.sh" \
	--exclude "README.md" \
	--exclude "LICENSE.txt" \
	-avh --no-perms . ~;

source ~/.bash_profile;

# install vim plugins
echo 'installing plugins for vim'
vim +PluginClean +qall
vim +PluginInstall +qall

# make todo actions usable
chmod +x $HOME/.todo/actions/.

# install tmux setup
tmux source ~/.tmux.conf
