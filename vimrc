"Setup
set nocompatible
set mouse=a

"force vim to use 256 colors
if $TERM == "xterm-256color"
    set t_Co=256
endif

"powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" for solarized
" set background=dark
set background=light

set number
set incsearch
set hlsearch
set nosol
set foldmethod=manual
set nofoldenable
set laststatus=2
set noshowmode
set tabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8
set termencoding=utf-8
set omnifunc=syntaxcomplete#Complete
set autochdir


filetype plugin indent on
cd ~/

"Bundles
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Bundle "vim-scripts/FuzzyFinder"
Bundle "vim-scripts/L9"
Bundle "szw/vim-ctrlspace"
Bundle "neilagabriel/vim-geeknote"
"Bundle "tpope/vim-vinegar"
"Bundle "kien/ctrlp.vim"
Bundle "scrooloose/nerdtree"
Bundle "flazz/vim-colorschemes"
"Bundle "bling/vim-airline"
Bundle "Lokaltog/powerline"
Bundle "yegappan/mru"
"Bundle "vim-scripts/Tabmerge"
"Bundle "vim-scripts/AutoComplPop"
Bundle "jcfaria/Vim-R-plugin"
"Bundle "smancill/conky-syntax.vim"
Bundle "jcf/vim-latex"
Bundle "Lokaltog/vim-easymotion"
"Bundle "nixon/vim-vmath"
"Bundle "mattn/emmet-vim"
"Bundle "vim-scripts/loremipsum"
Bundle "scrooloose/syntastic"
Bundle "vim-scripts/tComment"
"Bundle "vim-scripts/UltiSnips"
"Bundle "msanders/snipmate.vim"
Bundle "tpope/vim-sensible"
Bundle "bling/vim-bufferline"
Bundle "mileszs/ack.vim"
Bundle "xolox/vim-notes"
Bundle "xolox/vim-misc"
Bundle "vim-pandoc/vim-pandoc"
Bundle "vim-pandoc/vim-pantondoc"
"Bundle "vim-pandoc/vim-pandoc-syntax"
"Bundle "tpope/vim-commentary"
Bundle "godlygeek/tabular"
"Bundle "itchyny/calendar.vim"
"Bundle "tpope/vim-surround"
"Bundle "danchoi/vmail"
"Bundle "plasticboy/vim-markdown"
Bundle "tpope/vim-fugitive"
Bundle "Shougo/neocomplete.vim"
Bundle "ervandew/screen"
Bundle "klen/python-mode"


"All of your Plugins must be added before the following line
call vundle#end()            " required

colorscheme solarized

" Mappings
let mapleader = ","
"
" pandoc syntax highlighting on
let g:pandoc_no_empty_implicits = 1

let g:pymode_python = 'python3'

" python-mode settings
augroup vimrc_autocmd
    autocmd!
    autocmd FileType python set wrap
augroup END

" CTRL + L hides highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" F3 toggle folding
inoremap <f3> <C-O>za
nnoremap <f3> za
onoremap <f3> <C-C>za
vnoremap <f3> zf


" Geeknote quick toggle
noremap <F8> :Geeknote<cr>

" FuzzyFinder mappings
nnoremap <leader>fn :FufFile ~/notes/<cr>
nnoremap <leader>fd :FufFile ~/Dokumente/<cr>

" open vimrc
nnoremap <leader>v :e ~/.vimrc<CR>
nnoremap <leader>V :tabnew ~/.vimrc<CR>

" ACK Mappings
command! -nargs=1 ANo Ack -i "<args>" ~/notes/
command! -nargs=1 ANd Ack -i "<args>" ~/Dokumente/
nnoremap <leader>an :ANo 
nnoremap <leader>ad :ANd 

" Open Nerdtree with leader + t
nnoremap <leader>t :NERDTree<cr> 

" Take Quick Note with leader + n
nnoremap <leader>n :Note<cr>

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
command! WQ wq
command! Wq wq
command! W w
command! Q q

" Lines added by the Vim-R-plugin command :RpluginConfig (2014-Mai-13 21:39):
syntax enable

" Change the <LocalLeader> key:
let maplocalleader = ","

" Notes-Verzeichnis
let g:notes_directories = ['~/notes/']

" Opens NERDTREE with Bookmarks
let NERDTreeShowBookmarks=1

" Use Ctrl+Space to do omnicompletion:
if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif
imap jj <Esc>

" vim-vmath key maps
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++

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

" Tim Pope's Tabularize Addon
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
 
function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction

set list
set listchars=tab:▸\ ,eol:¬
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
" return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

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

" vim-latex settings
" compile to pdf
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'

