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

  echo "Cloning gh-pages branch ..."
  git clone --branch gh-pages https://github.com/pranabdas/${i} &> /dev/null
  cd ../${i}
  rm -rf build

  echo "Building site ..."
  npm run build &> /dev/null
  rsync -azh --exclude .git --delete build/ ../tmpghdeploy/${i}
  cd ../tmpghdeploy/${i}
  if [ -e ".DS_Store" ] ; then
    rm ".DS_Store"
  fi
  git add --all && git commit --amend --no-edit &> /dev/null
  git push origin gh-pages --force &> /dev/null
  printf "Deployed ${i}.\n\n"
  cd ../..
  rm -rf tmpghdeploy
done

cd ${current_pwd}
echo "All deployed."
