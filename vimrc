" File location: ~/.vimrc
syntax on
set tabstop=4 shiftwidth=4 expandtab
set ruler

"colorscheme
"colo darkblue
"colo delek
"colo desert
"colo murphy
colo slate

set hlsearch
hi Search ctermbg=LightBlue
hi Search ctermfg=black

" Wrap text after a certain number of characters
set textwidth=80
set autoindent
"set columns=80
"set colorcolumn=80
"set wrap
"set linebreak

"set nu
"set nonu

" Syntax highlight for custom filetypes
au BufRead,BufNewFile *.in set filetype=fortran
au BufRead,BufNewFile *.out set filetype=fortran
au BufRead,BufNewFile matplotlibrc set filetype=python

hi SpellBad ctermbg=Yellow
hi SpellBad ctermfg=DarkRed
set spellfile=~/.vim/en.utf-8.add    "type zg to add new words

autocmd User GnuPG call timer_start(1, 'FixRedraw', {})
func FixRedraw(timer)
        redraw!
endfunc

let g:GPGPreferArmor=1
let g:GPGDefaultRecipients=["lastname.firstname@example.com"]

call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/limelight.vim'
call plug#end()
