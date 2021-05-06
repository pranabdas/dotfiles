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
