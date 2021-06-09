# Build : docker build -t ubuntu -f ubuntu.dockerfile .
# Run   : docker run -ti -v ${PWD}:/home -p 8888:8888 ubuntu bash

FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update --fix-missing; apt upgrade -yq; \
    apt install -yq --no-install-recommends \
    wget \
    vim \
    git \
    python3 \
    python3-pip \
    ruby-full \
    build-essential \
    zlib1g-dev \
    locales \
    fonts-open-sans \
    xorg \
    openbox \
    mesa-utils \
    libgl1-mesa-glx \
    firefox && \

# Install pip packages
    pip3 install jupyterlab \
    numpy \
    scipy \
    matplotlib \
    pandas \
    xlrd \
    openpyxl \
    seaborn \
#    bokeh \
#    geopandas \
    scikit-learn \
    missingno && \

# nodejs LTS
    wget -O - https://deb.nodesource.com/setup_lts.x | bash - && \
    apt update && apt install -y --no-install-recommends nodejs && \

# settings
    echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc && \
    echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc && \
    echo "en_US UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    (echo 'export LANG=en_US.UTF-8' && \
     echo 'export LANGUAGE=en_US:en' && \
     echo 'export LC_ALL=en_US.UTF-8') >> $HOME/.bashrc && \
# jupyter-lab settings
    mkdir /etc/jupyter && \
    (echo "c.ServerApp.ip = '0.0.0.0'" && \
     echo "c.ServerApp.allow_root = True" && \
     echo "c.ServerApp.open_browser = False") \
       >> /etc/jupyter/jupyter_server_config.py && \

# Bundler and jekyll
    gem install jekyll bundler && \

# oh-my-bash
    git clone git://github.com/ohmybash/oh-my-bash.git ~/.oh-my-bash && \
    wget https://raw.githubusercontent.com/pranabdas/dotfiles/main/oh-my-bash.bashrc && \
    cat oh-my-bash.bashrc >> ~/.bashrc && \
    rm oh-my-bash.bashrc && \
    wget https://raw.githubusercontent.com/pranabdas/dotfiles/main/bash_history \
    -O ~/.bash_history

# matplotlib customizations
# RUN mkdir -p $HOME/.config/matplotlib && \
#     wget https://raw.githubusercontent.com/pranabdas/dotfiles/main/matplotlibrc \
#     -O $HOME/.config/matplotlib/matplotlibrc

# leave in `/home` which we can map with the host
WORKDIR /home