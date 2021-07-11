#!/bin/bash
base_path="${HOME}/Documents/github"

repo_list=()
repo_list+=(arpespythontools)
repo_list+=(espresso)
repo_list+=(linux)
repo_list+=(machine-learning)
repo_list+=(python-tutorial)
repo_list+=(suvtools)

current_pwd=${PWD}
cd ${base_path}
len=${#repo_list[@]}
progress=0

for i in "${repo_list[@]}"
  do cd ${i}
    progress=$((progress + 1))
    echo "Updating ${i} (${progress} of ${len})"
    npm update &> /dev/null
##    npx npm-check-updates --upgrade --target minor
# manual update for major versions (test carefully)
    sed -i.bak 's/"2.0.0-beta.3"/"2.0.0-beta.7babfe036"/gI' package.json &> /dev/null
    rm package.json.bak &> /dev/null

    echo "Deleting package-lock.json and node_modules ..."
    rm package-lock.json &> /dev/null
    mkdir empty && \
      rsync -r --delete empty/ node_modules && \
      rm -r node_modules empty &> /dev/null

    echo "Installing npm packages ..."
    npm install &> /dev/null

    echo "Applying customizations ..."
# customize codeblock background colors
    sed -i.bak 's/FBFBFB/f6f6f6/gI' \
      node_modules/prism-react-renderer/themes/nightOwlLight/index.cjs.js

    sed -i.bak 's/f6f8fa/f6f6f6/gI' \
      node_modules/prism-react-renderer/themes/github/index.cjs.js

#    rm -rf build
#    npm run build
#    npm run gh-deploy
    cd ${base_path}
    printf "Done ${i}.\n\n"
done
cd ${current_pwd}
echo "All done."
