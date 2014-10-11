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

filetype off
set nocompatible             
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
map <F3> :ProjectBuild
map <F4> :Java
map <F5> :!astyle %
map <F6> :!perl %
map <F10> :JavaImport

map < :bprev<CR>
map > :bnext<CR>

colorscheme inkpot




nmap <F7> :CopyDefinition<CR>
nmap <F8> :ImplementDefinition<CR>
command! CopyDefinition :call s:GetDefinitionInfo()
command! ImplementDefinition :call s:ImplementDefinition()
function! s:GetDefinitionInfo()
  exe 'normal ma'
  " Get class
  call search('^\s*\<class\>', 'b')
  exe 'normal ^w"ayw'
  let s:class = @a
  let l:ns = search('^\s*\<namespace\>', 'b')
  " Get namespace
  if l:ns != 0
    exe 'normal ^w"ayw'
    let s:namespace = @a
  else
    let s:namespace = ''
  endif
  " Go back to definition
  exe 'normal `a'
  exe 'normal "aY'
  let s:defline = substitute(@a, ';\n', '', '')
endfunction
 
function! s:ImplementDefinition()
  call append('.', s:defline)
  exe 'normal j'
  " Remove keywords
  s/\<virtual\>\s*//e
  s/\<static\>\s*//e
  if s:namespace == ''
    let l:classString = s:class . "::"
  else
    let l:classString = s:namespace . "::" . s:class . "::"
  endif
  " Remove default parameters
  s/\s\{-}=\s\{-}[^,)]\{1,}//e
  " Add class qualifier
  exe 'normal ^f(bi' . l:classString
  " Add brackets
  exe "normal $o{\<CR>\<TAB>\<CR>}\<CR>\<ESC>kkkk"
  " Fix indentation
  exe 'normal =4j^'
endfunction
