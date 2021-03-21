These are my personalized settings files.

#### Gitconfig 
Replace with actual email address. 
```
wget https://raw.githubusercontent.com/pranabdas/dotfiles/main/gitconfig -O ~/.gitconfig
```

#### VIM
Replace with actual email address for default GPG encryption address. 
```
wget https://raw.githubusercontent.com/pranabdas/dotfiles/main/vimrc -O ~/.vimrc
wget https://raw.githubusercontent.com/pranabdas/dotfiles/main/vim.zip
unzip vim
mv .vim ~/  # if working directory is not $HOME
```

#### VSCode
Install extensions:
```
code --install-extension bceskavich.theme-dracula-at-night \
emmanuelbeziat.vscode-great-icons \
esbenp.prettier-vscode \
ms-python.python \
ms-toolsai.jupyter \
streetsidesoftware.code-spell-checker
```

Location for VSCode settings file:  
**Windows:** `%APPDATA%\Code\User\settings.json`  
**macOS:** `$HOME/Library/Application\ Support/Code/User/settings.json`  
**Linux:** `$HOME/.config/Code/User/settings.json`

#### Font
<https://github.com/source-foundry/Hack>
