These are my personalized settings files.

### Gitconfig
```console
wget https://raw.githubusercontent.com/pranabdas/dotfiles/main/gitconfig -O ~/.gitconfig
```

### VIM
Replace with actual email address for default GPG encryption address.
```console
wget https://raw.githubusercontent.com/pranabdas/dotfiles/main/vimrc -O ~/.vimrc
wget https://raw.githubusercontent.com/pranabdas/dotfiles/main/vim.zip
unzip vim
mv .vim ~/  # if working directory is not $HOME
```

### VSCode
Install VSCode extensions:

Linux/macOS
```console
cat vscode-extensions.txt | xargs -L1 code --install-extension
```

Windows:
```console
foreach($line in get-content vscode-extensions.txt) {code --install-extension $($line)}
```

Location for VSCode settings file: <br/>
**Windows:** `%APPDATA%\Code\User\settings.json` <br/>
**macOS:** `$HOME/Library/Application\ Support/Code/User/settings.json` <br/>
**Linux:** `$HOME/.config/Code/User/settings.json`

### Python packages
```console
pip install --upgrade -r python-packages.txt
```

### Oh-my-zsh
```console
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install theme
wget https://raw.githubusercontent.com/pranabdas/dotfiles/refs/heads/main/moment.zsh-theme -O $ZSH/themes/moment.zsh-theme

# sguggested plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

Dracula theme profile for Terminal.app - https://draculatheme.com/terminal

### Oh-my-bash
```console
git clone git://github.com/ohmybash/oh-my-bash.git ~/.oh-my-bash
wget https://raw.githubusercontent.com/pranabdas/dotfiles/main/oh-my-bash.bashrc
cat oh-my-bash.bashrc >> ~/.bashrc
rm oh-my-bash.bashrc
```

### Bash history
```console
wget https://raw.githubusercontent.com/pranabdas/dotfiles/main/bash_history -O ~/.bash_history
```

### Fonts
- <https://github.com/source-foundry/Hack>
- <https://madmalik.github.io/mononoki/>

### Nodejs (LTS) installation on Ubuntu/Debian
```console
wget -O - https://deb.nodesource.com/setup_lts.x | sudo bash - && \
sudo apt update && sudo apt install -y --no-install-recommends nodejs
```
