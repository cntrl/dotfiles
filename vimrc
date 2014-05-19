"{{ Setup
set guifont=Bitstream_Vera_Sans_Mono:h11:cANSI
set nocompatible
set mouse=a
set number
set hlsearch
set nosol
set foldmethod=marker
set laststatus=2
set noshowmode
set encoding=utf-8
set termencoding=utf-8
set omnifunc=syntaxcomplete#Complete
set autochdir


filetype plugin indent on
cd /media/Datenablage/Dropbox/Dokumente/
    highlight ColorColumn ctermbg=magenta
        call matchadd('ColorColumn', '\%81v', 100)

" }}}


"{{ Bundles
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'


Bundle "vim-scripts/FuzzyFinder"
Bundle "vim-scripts/L9"
"Bundle "szw/vim-ctrlspace"
"Bundle "tpope/vim-vinegar"
Bundle "kien/ctrlp.vim"
Bundle "scrooloose/nerdtree"
Bundle "flazz/vim-colorschemes"
Bundle "bling/vim-airline"
Bundle "yegappan/mru"
Bundle "vim-scripts/Tabmerge"
"Bundle "vim-scripts/AutoComplPop"
Bundle "jcfaria/Vim-R-plugin"
"Bundle "smancill/conky-syntax.vim"
Bundle "jcf/vim-latex"
Bundle "Lokaltog/vim-easymotion"
Bundle "nixon/vim-vmath"
"Bundle "mattn/emmet-vim"
Bundle "vim-scripts/loremipsum"
"Bundle "scrooloose/syntastic"
"Bundle "vim-scripts/tComment"
"Bundle "vim-scripts/UltiSnips"
"Bundle "msanders/snipmate.vim"
Bundle "tpope/vim-sensible"
Bundle "bling/vim-bufferline"
Bundle "mileszs/ack.vim"
Bundle "xolox/vim-notes"
Bundle "xolox/vim-misc"
Bundle "vim-pandoc/vim-pandoc"
Bundle "vim-pandoc/vim-pantondoc"
Bundle "vim-pandoc/vim-pandoc-syntax"
"Bundle "tpope/vim-commentary"
"Bundle "godlygeek/tabular"
Bundle "itchyny/calendar.vim"
"Bundle "tpope/vim-surround"
Bundle "danchoi/vmail"
Bundle "plasticboy/vim-markdown"
Bundle "tpope/vim-fugitive"
Bundle "Shougo/neocomplete.vim"


"All of your Plugins must be added before the following line
call vundle#end()            " required


"}}}


" {{Mappings
" map the leader button
let mapleader = ","
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1


" ignoriert Buchstaben j und k bei OMNIpopup
" inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
" inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
"
" ctrlp working path disable
let g:ctrlp_working_path_mode = 0

" pandoc syntax highlighting on
let g:pandoc_no_empty_implicits = 1

" löst Verknüpfung der Pfeiltasten
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" verknüpft ESC mit speichern :w
" inoremap <Esc> <Esc>:w<CR>
"
nnoremap <silent> <C-l> :nohl<CR><C-l>

" F9 toggle folding
inoremap <f3> <C-O>za
nnoremap <f3> za
onoremap <f3> <C-C>za
vnoremap <f3> zf

" FuzzyFinder mappings
nnoremap <leader>fn :FufFile /media/Datenablage/Dropbox/Dokumente/Notes/<cr>
nnoremap <leader>fd :FufFile /media/Datenablage/Dropbox/Dokumente/<cr>

" open vimrc
nnoremap <leader>v :e ~/.vimrc<CR>
nnoremap <leader>V :tabnew ~/.vimrc<CR>

" ACK Mappings
command! -nargs=1 ANo Ack -i "<args>" /media/Datenablage/Dropbox/Dokumente/Notes/
command! -nargs=1 ANd Ack -i "<args>" /media/Datenablage/Dropbox/Dokumente/
nnoremap <leader>an :ANo 
nnoremap <leader>ad :ANd 

" Open Nerdtree with leader + t
nnoremap <leader>t :NERDTree<cr> 

" Take Quick Note with leader + n
nnoremap <leader>n :Note<cr>

" MostRecentlyUsed with leader + m
nnoremap <leader>m :Mru<cr>

" Calendar with leader + c
nnoremap <leader>c :Calendar<cr>
au FileType pandoc map  <F5>  :w<CR>:PandocHtml<CR><ESC>
au FileType pandoc imap <F5>  <esc><F5>a
au FileType pandoc map  <F6>  :w<CR>:PandocPdf<CR><ESC>
au FileType pandoc imap <F6>  <esc><F6>a
" }}}



" {{ Some specific configurations
" Lines added by the Vim-R-plugin command :RpluginConfig (2014-Mai-13 21:39):
syntax enable

" Change the <LocalLeader> key:
let maplocalleader = ","

" Notes-Verzeichnis
:let g:notes_directories = ['/media/Datenablage/Dropbox/Dokumente/Notes/']

" Opens NERDTREE with Bookmarks
let NERDTreeShowBookmarks=1

" Use Ctrl+Space to do omnicompletion:
if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif

" Press the space bar to send lines (in Normal mode) and selections to R:
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" Force Vim to use 256 colors if running in a capable terminal emulator:
if &term =~ "xterm" || &term =~ "256" || $DISPLAY != "" || $HAS_256_COLORS == "yes"
    set t_Co=256
endif

" vim-vmath key maps
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>
colorscheme candyman

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
" }}}
"
"{{{Neocomplete Setup
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }}}

