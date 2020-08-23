#! /bin/bash

if ! command -v zsh &> /dev/null
then
	echo "Please install ZSH"
	exit
fi

if ! command -v git &> /dev/null
then
	echo "Please install git"
	exit
fi

zsh -c "sh -c '(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)'"


