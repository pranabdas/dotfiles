export DEBIAN_FRONTEND="noninteractive"
sudo apt update && sudo apt upgrade -y

cat oh-my-bash.bashrc >> ~/.bashrc
git clone https://github.com/ohmybash/oh-my-bash.git ~/.oh-my-bash

wget https://raw.githubusercontent.com/pranabdas/dotfiles/main/bash_history -O ~/.bash_history

unzip vim
mv .vim ~/

cat vscode-extensions.txt | xargs -L1 code --install-extension
cat vscode-settings.json > $HOME/.config/Code/User/settings.json

sudo cp bash_history ~/.bash_history

