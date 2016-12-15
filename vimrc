set nocompatible
set vb
set nobk
set nowb

color koehler

let NERDTreeIgnore = ['\.pyc$']
" autocmd VimEnter * NERDTree
" #autocmd BufEnter * NERDTreeMirror

" autocmd VimEnter * wincmd w

syntax on
filetype plugin indent on
set foldmethod=indent
set foldlevel=99
"set expandtab
set tabstop=8
set ts=4
set sw=4
set hls
"autocmd FileType python
set omnifunc=pythoncomplete#Complete
set ofu=syntaxcomplete#Complete

inoremap <c-space> <c-x><c-o>
imap <S-BS> <Esc>:set noet<CR>:.retab!<CR>a<BS><Esc>:set et<CR>:.retab<CR>:.+retab<CR>a

"completion with smart TAB
function! CleverTab2()
	if strpart( getline('.'), col('.')-2, 1 ) =~ '[A-Za-z0-9_]'
		return "\<C-N>"
	else
		return "\<Tab>"
endfunction
inoremap <Tab> <C-R>=CleverTab2()<CR>

set tags=~/ctags/c_tags,~/ctags/stl_tags,./tags

set cindent

" visual
set vb

" filetype
set background=dark

" tagmenu.vim
let Tlist_ctags_cmd ='/common/rte/gnuutl/soft/pkgs/product/SunOS5.8/bin/ctags'

" Mappings

" middle mouse pastes
map <S-Insert> <MiddleMouse>
map! <S-Insert> <RightMouse>

"Collapse multiple contiguous empty lines into a single line
map <Leader>b GoZ<Esc>:g/^$/.,/./-j<CR>Gdd

"Collapse multiple contiguous blank lines into a single line
map <Leader>n GoZ<Esc>:g/^[ <Tab>]*$/.,/[^ <Tab>]/-j<CR>Gdd

"Remove trailing spaces at the end of a line
map <Leader>e :%s/\(.*[^ ][^ ]*\)  *$/\1/c<CR>

"Remove leading spaces at the beginning of a line
map <Leader>f :%s/^  *\(.*\)/\1/c<CR>

"Collapse multiple contiguous spaces into a single space
map <Leader>g :%s/  \+/ /<CR>

"Russian rulette :P
map <F12> :echo system("echo $(($RANDOM \% 6))") ? "*Click*" : "Bang!"<CR>

"Comment line
map <Leader>/ 0i//<Esc>

" Toggle NERDTree On and Off
map <F10> :NERDTreeToggle<CR>

"statusline
set statusline=%<%F%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'
"hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red
set laststatus=2

let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" Plug 'junegunn/seoul256.vim'
 Plug 'junegunn/vim-easy-align'
" Group dependencies, vim-snippets depends on ultisnips
 Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
 Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
 Plug 'Valloric/YouCompleteMe', { 'for': 'cpp' }
 autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif
" Using git URL
 Plug 'https://github.com/junegunn/vim-github-dashboard.git'
call plug#end()
