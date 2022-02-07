# install updates
sudo apt update && sudo apt upgrade -y

# install required packages
sudo apt install -yq --no-install-recommends \
    wget \
    vim \
    git \
    python3 \
    python3-pip \
    openssh-server \
    build-essential \
    rsync \
    fonts-open-sans \
    fontconfig

# install python packages
pip3 install jupyterlab \
    numpy \
    scipy \
    matplotlib \
    pandas \
    xlrd \
    openpyxl

echo 'export PATH="/home/pranab/.local/bin/:$PATH"' >> ~/.bashrc

# jupyter-lab settings
sudo mkdir /etc/jupyter && \
    (echo "c.ServerApp.ip = '0.0.0.0'" && \
     echo "c.ServerApp.allow_root = True" && \
     echo "c.ServerApp.open_browser = False") \
        | sudo tee /etc/jupyter/jupyter_server_config.py

# install oh-my-bash
git clone git://github.com/ohmybash/oh-my-bash.git ~/.oh-my-bash
wget https://raw.githubusercontent.com/pranabdas/dotfiles/main/oh-my-bash.bashrc
cat oh-my-bash.bashrc >> ~/.bashrc
rm oh-my-bash.bashrc

# bash history
wget https://raw.githubusercontent.com/pranabdas/dotfiles/main/bash_history \
-O ~/.bash_history

# make symlink for dropbox folder
ln -s /mnt/d/Dropbox ~/dropbox

# map and mount Windows K drive
sudo mkdir /mnt/k
sudo mount -t drvfs K: /mnt/k


# install xcrysdns
sudo apt install -y --no-install-recommends bc xcrysden
echo "export DISPLAY=:0" >> ~/.bashrc

# install nodejs
wget -O - https://deb.nodesource.com/setup_lts.x | sudo bash - && \
sudo apt update && sudo apt install -y --no-install-recommends nodejs

# install latex (about 1.8GB space required)
sudo apt install -y --no-install-recommends \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-science \
    texlive-pictures \
    texlive-luatex

# cleanup
sudo apt autoremove --purge

