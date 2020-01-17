# biras_weird_cousin
# Theme based on Bira theme from oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/bira.zsh-theme
# Some code stolen from oh-my-fish clearance theme: https://github.com/bpinto/oh-my-fish/blob/master/themes/clearance/

# Adds a badge if we're in an SSH session (first letter of hostname, uppercased)
function __ssh_badge
	if test -n "$SSH_CLIENT$SSH2_CLIENT$SSH_TTY"
		set_color -b d6aeec -o 2a0a8b
		echo -n " "(string upper (string sub -s 1 -l 1 (hostname -s)))" "
		set_color normal
	end
end

# only display a host name if we're in an ssh session
function __ssh_host
	if test -n "$SSH_CLIENT$SSH2_CLIENT$SSH_TTY"
		set_color -d white
		echo -n $USER@
		set_color normal
		set_color -d -o brmagenta
		echo -n (hostname -s)
		set_color normal
	end
end

function __user_host
	if test (id -u) -eq 0
		set_color --bold red
	else
		set_color --bold green
	end
	echo -n $USER@(hostname -s) (set_color normal)
end

function __current_path
	# Replace HOME with ~
	set -l path (string replace "$HOME" (set_color 87ff00)"~" (pwd))
	# Highlight last path element
	set -l parts (string split "/" $path)
	set parts[-1] (set_color normal)(set_color -o df005f)$parts[-1](set_color normal)
	set path (string join "/" $parts)

	echo -n " "$path(set_color normal)
end

function _git_branch_name
	echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
	echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function __git_status
	if [ (_git_branch_name) ]
		set -l git_branch (_git_branch_name)

		if [ (_git_is_dirty) ]
			set git_color "df5f00"
			set git_info '('$git_branch"*"')'
		else
			set git_color "5fdfff"
			set git_info '('$git_branch')'
		end

		echo -n (set_color $git_color) $git_info (set_color normal)
	end
end

function fish_prompt
	set -l st $status
	set -l pchar (set_color --bold white)"❯"
	if [ $st != 0 ];
		set pchar (set_color --bold red)"❯"
	end

	echo -n (set_color blue)"╭─"(set_color normal)
	# __user_host
	__ssh_badge
	__current_path
	__git_status
	echo -e ''

	## SetMark adds iTerm marks, but now it's being set with an event hook
	## via shell integration
	# echo -e "\033]1337;SetMark\a"
	echo -e (set_color blue)"╰─$pchar "(set_color normal)
end

function fish_right_prompt
	set -l st $status
	if [ $st != 0 ];
		echo (set_color red) ↵ $st (set_color normal)
	end
	__ssh_host
	set_color -o 666
	date '+ %T'
	set_color normal
end
