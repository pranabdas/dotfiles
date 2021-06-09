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

if [ -d "tmpghdeploy" ] ; then
  rm -rf tmpghdeploy
fi

for i in "${repo_list[@]}"

do mkdir tmpghdeploy
  progress=$((progress + 1))
  echo "Deploying ${i} (${progress} of ${len})"
  cd tmpghdeploy
  touch empty
  git init &> /dev/null
  git remote add origin https://github.com/pranabdas/${i}.git &> /dev/null
  git add --all && git commit -m "Clean deploy" &> /dev/null
  git branch gh-pages &> /dev/null
  git checkout gh-pages &> /dev/null
  cd ../${i}
  echo "Building site ..."
  rm -rf build
  npm run build &> /dev/null
  echo "Deploying ..."
  rsync -azh --exclude .git --delete build/ ../tmpghdeploy
  cd ../tmpghdeploy
  if [ -e ".DS_Store" ] ; then
    rm ".DS_Store"
  fi
  git add --all && git commit --amend --no-edit &> /dev/null
  git push origin gh-pages --force &> /dev/null
  printf "Deployed ${i}.\n\n"
  cd ..
  rm -rf tmpghdeploy
done
cd ${current_pwd}
echo "All deployed."
