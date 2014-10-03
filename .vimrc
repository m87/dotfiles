autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
set backspace=indent,eol,start

let g:EclimCompletionMethod = 'omnifunc'

set foldmethod=indent
set t_Co=256
set cursorline

let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1


set tabstop=4
set shiftwidth=4
set expandtab
syntax on

set autoindent
set number


set nocompatible             
filetype off                 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tkztmk/vim-vala'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'morhetz/gruvbox'
Plugin 'vim-scripts/summerfruit256.vim'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'
Plugin 'zeis/vim-kolor'
Plugin 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'
Plugin 'honza/vim-snippets'

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<F4>"
let g:UltiSnipsJumpBackwardTrigger="<F3>"

let g:UltiSnipsEditSplit="vertical"

call vundle#end()            
filetype plugin indent on    
let g:ycm_autoclose_preview_window_after_completion = 1
let g:NERDTreeWinPos = "right"
map <C-d> :NERDTreeToggle<CR>
map <C-l> :Tlist<CR>
map <C-b> :MBEToggleAll<CR>
map <F1> :!python2.7 %
map <F2> :!python %

map < :bprev<CR>
map > :bnext<CR>
map <F5> :!astyle %

colorscheme inkpot
