call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'junegunn/seoul256.vim'
Plug 'jalvesaq/Nvim-R'
Plug 'yegappan/mru'
Plug 'Lokaltog/vim-easymotion'
Plug 'vim-scripts/tComment'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'szw/vim-ctrlspace'
Plug 'Raimondi/delimitMate'
Plug 'lervag/vimtex'
Plug 'neovimhaskell/haskell-vim'


call plug#end()

"Setup
cd ~/
set hidden
set mouse=a
set laststatus=2
set tabstop=4
set shiftwidth=4
set infercase
set hlsearch
set incsearch
set nosol
set foldmethod=manual
set nofoldenable
set laststatus=2
set noshowmode
set tabstop=4
set shiftwidth=4
set expandtab

filetype plugin on
filetype indent on

let mapleader = ","
let maplocalleader = ","
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1


imap jj <Esc>

command! WQ wq
command! Wq wq
command! W w
command! Q q


" Unified color scheme (default: dark)
let g:seoul256_background = 234
colo seoul256
set background=dark

" CTRL + L hides highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" F3 toggle folding
inoremap <f3> <C-O>za
nnoremap <f3> za
onoremap <f3> <C-C>za
vnoremap <f3> zf

" open vimrc
nnoremap <leader>v :e ~/.nvimrc<CR>
nnoremap <leader>V :tabnew ~/.nvimrc<CR>

" Open Nerdtree with leader + t
nnoremap <leader>t :NERDTree<cr> 

" Take Quick Note with leader + n
" nnoremap <leader>n :Note<cr>
nnoremap <leader>n :tabnew ~/notes/.md

" MostRecentlyUsed with leader + m
nnoremap <leader>m :Mru<cr>

" leader + p konvertiert file in pdf um via pandoc
nnoremap <leader>p :!pandoc % -o %.pdf<cr>

" leader + z öffnet file in zathura 
nnoremap <leader>z :!zathura %.pdf<cr><cr>

au FileType pandoc map  <F5>  :w<CR>:PandocHtml<CR><ESC>
au FileType pandoc imap <F5>  <esc><F5>a
au FileType pandoc map  <F6>  :w<CR>:PandocPdf<CR><ESC>
au FileType pandoc imap <F6>  <esc><F6>a

" write / close / write and close with capital letters and non capital letters

" Lines added by the Vim-R-plugin command :RpluginConfig (2014-Mai-13 21:39):
syntax enable
syntax on

" Notes-Verzeichnis
let g:notes_directories = ['~/notes/']

" Opens NERDTREE with Bookmarks
let NERDTreeShowBookmarks=1


" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

" EITHER blink the line containing the match...
function! HLNext (blinktime)
    set invcursorline
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 100) . 'm'
    set invcursorline
    redraw
endfunction

set list
set listchars=tab:▸\ ,eol:¬
"

"------------------------------------
" Nvim-R
"------------------------------------
if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine


hi CtrlSpaceSelected term=reverse ctermfg=187  ctermbg=23  cterm=bold
hi CtrlSpaceNormal   term=NONE    ctermfg=244  ctermbg=232 cterm=NONE
hi CtrlSpaceSearch   ctermfg=220  ctermbg=NONE cterm=bold
hi CtrlSpaceStatus   ctermfg=230  ctermbg=234  cterm=NONE

hi CtrlSpaceNormal guifg=#839496 guibg=#073642 guisp=#839496 gui=NONE ctermfg=12 ctermbg=0 cterm=NONE


let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }



let R_in_buffer = 1
" let R_applescript = 0
" let R_tmux_split = 1

" let R_tmux_title = "Nvim-R"
" let R_tmux_title = "automatic"

" let R_tmux_ob = 0
"
"
let R_openpdf = 1
let R_ca_ck = 1
let R_assign = 2
let R_objbr_w = 30
" let R_objbr_place = "console,right"


if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif
<
