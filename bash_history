#1621910370
wget https://raw.githubusercontent.com/pranabdas/dotfiles/main/bash_history -O ~/.bash_history
#1621910380
tar -zxvf package.tgz
#1621910386
pdflatex main.tex
#1621910393
git remote add origin https://github.com/pranabdas/docusaurus.git
#1621910400
git reset --hard origin/master
#1621910406
mkdir empty && rsync -r --delete empty/ node_modules && rmdir node_modules && rmdir empty
#1621910411
git commit -m "updates"
#1621910416
git push origin master --force
#1621910422
git push origin master
#1621910427
git remote -v
#1621910432
git commit --amend
#1621910437
git add --all
#1621910438
git init
#1621910439
git status
#1621910443
mkdocs build
#1621910448
mkdocs serve --dev-addr=0.0.0.0:8000
#1621910456
git clone --branch gh-pages --depth 1 https://github.com/pranabdas/arpespythontools.git
#1621910462
jupyter-lab
#1621910470
bundle exec jekyll build
#1621910476
bundle exec jekyll serve --host 0.0.0.0 --port 4000
#1621910477
npm install
#1621910478
npm start
#1621910479
npm run build
#1621910480
npm run gh-deploy
