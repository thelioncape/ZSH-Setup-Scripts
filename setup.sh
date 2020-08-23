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

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

zsh -c "sh -c '(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)'"

