autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set tabstop=4
set shiftwidth=4
set expandtab

let g:ycm_autoclose_preview_window_after_completion = 1
let g:NERDTreeWinPos = "right"
map <C-d> :NERDTreeToggle<CR>
map <C-l> :Tlist<CR>
map <C-b> :MBEToggleAll<CR>

set autoindent
set number
colorscheme evening 


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')


Plugin 'fholgado/minibufexpl.vim'
Plugin 'morhetz/gruvbox'
Plugin 'vim-scripts/summerfruit256.vim'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'
Plugin 'zeis/vim-kolor'


" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<F4>"
let g:UltiSnipsJumpBackwardTrigger="<F3>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"




" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
