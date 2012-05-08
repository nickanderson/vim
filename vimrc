" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" TODO: this may not be in the correct place. It is intended to allow
"       overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" =============== Pathogen Initialization ===============
" This loads all the plugins in ~/.vim/bundle
" Use tpope's pathogen plugin to manage all other plugins
    runtime bundle/vim-pathogen/autoload/pathogen.vim
    call pathogen#infect()
    call pathogen#helptags()

" Disable the Keyword Abbreviations for vim_cf3 plugin
" I don't like how they work.
let g:DisableCFE3KeywordAbbreviations=0

" Enable incrimental searching (search as you type)
set incsearch
" Default search to case insensitive
set ignorecase 
" Override default case insensitve search if first letter is capitolized
set smartcase
" Set search to wrap around to top of file
set wrapscan 

" Enable per file vim settings
set modeline
" Check the first and last x lines for vim settings
set modelines=10

" Set the color scheme
set background=dark
colorscheme solarized

set showcmd " get visual feedback of commands

" Map F9 to toggle folding
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
"setlocal textwidth=79
setlocal smarttab
setlocal expandtab

syntax on
filetype plugin on 
filetype indent on

au BufRead,BufNewFile *.cf set filetype=cf3 " override filetype for .cf files to be cf3
au BufNewFile,BufRead *.zone set filetype=bindzone " Match for bind zonefile
au BufNewFile,BufRead *.rev set filetype=bindzone " Match for bind zonefile


" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
" set viminfo='10,\"100,:20,%,n~/.viminfo
set viminfo='20,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
