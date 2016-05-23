set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" FE plugins
Plugin 'mattn/emmet-vim'
Plugin 'lepture/vim-jinja'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'

" Python
Plugin 'davidhalter/jedi-vim'	" autocompletion

" General
Plugin 'scrooloose/nerdTree'
Plugin 'crusoexia/vim-monokai'
Plugin 'scrooloose/syntastic'	" syntax checker
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/ctrlp.vim'  " fuzzy file search
Plugin 'tpope/vim-repeat'
Plugin 'kana/vim-textobj-user'
Plugin 'beloglazov/vim-textobj-quotes'

" All of your Plugins must be added before the following line
call vundle#end()            	" required


" Configurations
filetype plugin indent on
set tabstop=4 			" show existing tab with 4 spaces width
set shiftwidth=4		" when indenting with '>', use 4 spaces width
set softtabstop=4
set expandtab			" on pressing tab, insert 4 spaces
set colorcolumn=80
set cursorline          " add line below the active line unde cursor
set number
"set autoindent          " indent when moving to the next line while writing code 
set showmatch           " show the matching part of the pair for [] {} and ()
set iskeyword-=_,.      " treat _ . a word boundary
syntax enable
colorscheme monokai

" Ctrl-P
let g:ctrlp_use_caching = 0
let g:ctrlp_max_files=0
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'


" Silver search
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup
endif

" Mapping
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" bind <C-g> to grep word under cursor and open in quickfix buffer
nnoremap <C-g> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><C-w>L
nnoremap <C-x> :q <CR>

xmap q iq
omap q iq

" NERD tree START 

"Openup Nerdtree if no file specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  
"If only Nerdtree is the only windows left close vim
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Openup NerdTree always when vim is started
"autocmd vimenter * NERDTree

" Map NerdTree to Ctrl-n
map <C-n> :NERDTreeToggle<CR>

" NERD tree END



" Python Specific START
" set tabs to have 4 spaces
au Filetype python set ts=4
  
" when using the >> or << commands, shift lines by 4 spaces
au Filetype python  set shiftwidth=4

" enable all Python syntax highlighting features
au Filetype python let python_highlight_all = 1
    
" expand tabs into spaces
au Filetype python set expandtab
       
"Display tabs as >---
au Filetype python set list
au Filetype python set listchars=tab:>-
"Python Specific END

" Syntastic START
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:syntastic_mode_map = { 'passive_filetypes': ['python', 'javascript'] }
let g:syntastic_disabled_filetypes=['html', 'jinja2']
"let g:syntastic_debug = 3

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
" Syntastic END 
