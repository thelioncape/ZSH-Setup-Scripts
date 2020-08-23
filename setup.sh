#! /bin/bash

if ! command -v zsh &> /dev/null
then
	echo "Please install ZSH"
	exit
fi

zsh -c "sh -c '(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)'"


