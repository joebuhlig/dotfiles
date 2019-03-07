git -C $HOME/dotfiles pull origin master

rsync --exclude ".git/" \
	--exclude ".gitmodules" \
	--exclude ".DS_Store" \
	--exclude ".osx" \
	--exclude "bootstrap.sh" \
	--exclude "linux-install.sh" \
	--exclude "README.md" \
	--exclude "LICENSE.txt" \
	-avh --no-perms . ~;

# install vim plugins
echo 'installing plugins for vim'
vim +PluginClean +qall
vim +PluginInstall +qall

# make todo actions usable
chmod -R +x $HOME/.todo/actions

# install tmux setup
tmux source ~/.tmux.conf

source ~/.bash_profile;

