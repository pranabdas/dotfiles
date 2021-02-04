# cat oh-my-bash.bashrc >> ~/.bashrc

export OSH=$HOME/.oh-my-bash

#OSH_THEME="demula"
#OSH_THEME="slick"
OSH_THEME="standard"

DISABLE_AUTO_UPDATE="true"

completions=(
  git
  composer
  ssh
)

aliases=(
  general
)

plugins=(
  git
  bashmarks
)

source $OSH/oh-my-bash.sh
