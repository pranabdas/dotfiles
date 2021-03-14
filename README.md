These are my personalized settings files.

#### VIM
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
streetsidesoftware.code-spell-checker
```

Location for settings file:  
**Windows:** %APPDATA%\Code\User\settings.json  
**macOS:** $HOME/Library/Application\ Support/Code/User/settings.json  
**Linux:** $HOME/.config/Code/User/settings.json
