#!/bin/bash
mkdir github_backup_$(date +'%Y%m%d') && cd $_

repo_list=()
repo_list+=(Access-OneDrive-via-Microsoft-Graph-Python)
repo_list+=(arpesapp)
repo_list+=(arpes-suv-man)
repo_list+=(arpespythontools)
repo_list+=(cheatsheets)
repo_list+=(condmat-notes)
repo_list+=(cryptomator)
repo_list+=(data-projects)
repo_list+=(doc-template)
repo_list+=(dotfiles)
repo_list+=(drive)
repo_list+=(espresso)
repo_list+=(fortran)
repo_list+=(fullprof)
repo_list+=(git-learning)
repo_list+=(js-learning)
repo_list+=(labrunner)
repo_list+=(LaTeX)
repo_list+=(linux)
repo_list+=(homepage-beta)
repo_list+=(homepage-dev)
repo_list+=(machine-learning)
repo_list+=(openssl.vim)
repo_list+=(other-projects)
repo_list+=(pranab)
repo_list+=(pranab.netlify.app)
repo_list+=(pranabdas.github.io)
repo_list+=(python-tutorial)
repo_list+=(react-auth0)
repo_list+=(react-learning)
repo_list+=(retasks)
repo_list+=(sg-camera)
repo_list+=(suvapp)
repo_list+=(suvtools)
repo_list+=(vim-gnupg)

len=${#repo_list[@]}
progress=0

for i in "${repo_list[@]}"
do mkdir ${i}
    cd ${i}

    progress=$((progress + 1))
    echo "Mirroring ${i} (${progress} of ${len})"

    git clone --mirror https://github.com/pranabdas/${i}.git .git
    git config --unset core.bare
    git reset --hard
    cd ..
    printf "Done ${i}.\n\n"
done

cd ..
echo "All done."
