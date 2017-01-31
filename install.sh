#!/bin/sh

# meant to be installed on a new system, from the user's home directory,
# with something like:
# curl -s https://raw.githubusercontent.com/racingmars/dotfiles/master/install.sh | sh
#
# This whole thing is a pretty poor way to do things but it is quick & dirty.

BACKUP_DIR=${HOME}/dotfiles-backup
mkdir $BACKUP_DIR

# move cruft out of the way for the user to deal with later
mv -f .profile .bashrc .bash_logout .bash_history "$BACKUP_DIR"

if [ -e lib/dotfiles ]; then
	echo "Dotfiles directory already exists. Exiting."
	return
fi

git clone https://github.com/racingmars/dotfiles.git lib/dotfiles

makelink()
{
	SOURCE=$1
	DEST=$2
	if [ -e "$DEST" ]; then
		mv "$DEST" "$BACKUP_DIR"
	fi
	ln -s "lib/dotfiles/$SOURCE" "$DEST"
}

makelink zshenv .zshenv
makelink zshrc .zshrc
makelink vimrc .vimrc
makelink Xresources .Xresources
makelink screenrc .screenrc
mkdir .vim
makelink snippets .vim/snippets

# Set up Vim Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

mkdir .ssh
chmod 700 .ssh

