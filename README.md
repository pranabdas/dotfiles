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
- [SAP 72](https://experience.sap.com/fiori-design-web/downloads/#download-font-72)
- [Manrope](https://fonts.google.com/specimen/Manrope?query=manrope)
- [IBM Plex](https://github.com/IBM/plex/releases)
- [Open Sans](https://fonts.google.com/specimen/Open+Sans)

### Nodejs (LTS) installation on Ubuntu/Debian
```console
wget -O - https://deb.nodesource.com/setup_lts.x | sudo bash - && \
sudo apt update && sudo apt install -y --no-install-recommends nodejs
```

### Docker

Useful docker commands:
```console
docker build -t latex .
docker build -t latex -f latex.dockerfile .

docker run -ti ubuntu bash
docker run -it --rm -v ${PWD}:/home -p 8888:8888 jupyter bash
docker run -it --rm -v ${PWD}:/home fedora pdflatex main.tex

# X11 forwarding
# macOS
docker run --rm -ti -e DISPLAY=docker.for.mac.host.internal:0 ubuntu bash
# Windows
docker run --rm -ti -e DISPLAY=host.docker.internal:0 jess/firefox
# Linux
docker run --rm -ti --net=host -e DISPLAY=:0 jess/firefox

# Jekyll
bundle exec jekyll serve --host 0.0.0.0 --port 4000
bundle exec jekyll build

# Mkdocs
docker run -ti -v ${PWD}:/home -p 8000:8000 mkdocs bash
mkdocs new mydocs && cd mydocs
mkdocs serve --dev-addr=0.0.0.0:8000
docker run -it --rm -v ${PWD}:/home ubuntu mkdocs build

# list images
docker images

# list containers
docker ps -a

# delete stopped containers
docker container prune

# delete a dpecific image
docker rmi <image-id or name>

# delete evrything
docker system prune -a
```

