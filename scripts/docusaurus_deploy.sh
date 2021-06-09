#!/bin/bash
base_path="${HOME}/Documents/github"

repo_list=()
repo_list+=(arpespythontools)
repo_list+=(linux)
repo_list+=(machine-learning)
repo_list+=(python-tutorial)
repo_list+=(qe-dft)
repo_list+=(suvtools)

current_pwd=${PWD}
cd ${base_path}
len=${#repo_list[@]}
progress=0

for i in "${repo_list[@]}"
do cd ${i}
  echo "Deploying ${i} (${progress} of ${len})"
  rm -rf build
  npm run build &> /dev/null
  npm run gh-deploy &> /dev/null
  cd ..
  printf "Deployed ${i}.\n\n"
done
cd ${current_pwd}
echo "All deployed."
