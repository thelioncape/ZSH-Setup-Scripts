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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Copy bullet-train theme to ZSH CUSTOM directory
cp $DIR/bullet-train.zsh-theme $HOME/.oh-my-zsh/custom/bullet-train.zsh-theme

# Modify .zshrc to use bullet-train theme
sed -i 's~\(ZSH_THEME="\)[^"]*\(".*\)~\1bullet-train\2~' $HOME/.zshrc

echo "Completed"
