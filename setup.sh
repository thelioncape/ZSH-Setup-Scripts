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

# Add SSH Agent Configuration to zshrc
cat <<EOT >> ~/.zshrc
SSH_ENV="\$HOME/.ssh/agent-environment"

function start_agent {
	echo "Initialising new SSH agent..."
	/usr/bin/ssh-agent | sed 's/^echo/#echo/' > "\${SSH_ENV}"
	echo succeeded
	chmod 600 "\${SSH_ENV}"
	. "\${SSH_ENV}" > /dev/null
	/usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "\${SSH_ENV}" ]; then
	. "\${SSH_ENV}" > /dev/null
	ps -ef | grep \${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
		start_agent;
	}
else
	start_agent;
fi
EOT

echo "Completed"
