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

# Get script directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Install oh-my-zsh
zsh -c "sh -c '(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)'"

# Copy bullet-train theme to ZSH CUSTOM directory
cp $DIR/bullet-train.zsh-theme $ZSH_CUSTOM/bullet-train.zsh-theme

