set nocompatible " disable compatibility to old vim
set showmatch " show matching brackets
set ignorecase " case insentive matching
set hlsearch " highlght search results
set tabstop=4 " columns occupied by a tab
set softtabstop=4 " multiple spaces as tabs
set expandtab " convert tabs to spaces
set shiftwidth=4 " set indentation amount for newline
set autoindent
set number " add line numbers
set wildmode=longest,list  " bash style completion
set cc=80 " visible column at 80
filetype plugin indent on " allow autindent depending on filetype
syntax on " obviously turn the syntax highlighting on

call plug#begin('~/.local/share/nvim/plugged')
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'

" linting support
Plug 'neomake/neomake'

" File tree
Plug 'scrooloose/nerdtree'

" the theme
Plug 'morhetz/gruvbox'

" surround
Plug 'machakann/vim-sandwich'

" search for files fast
Plug 'ctrlpvim/ctrlp.vim'

" format code
Plug 'sbdchd/neoformat'
call plug#end()

colorscheme gruvbox
set background=dark " use dark mode

" open nerd tree with leader t ( , t)
nnoremap ,t :NERDTreeToggle<CR> 

" set the shortcuts for searching to ctrl p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#python_path="/usr/local/bin/python3"

" automatically close the preview info window from deoplete
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" tab and shift tab to go up and down
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" formatter to use for python
let g:neoformat_enabled_python = ['black']

" format on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END


" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

let g:neomake_python_enabled_makers = ['flake8']
call neomake#configure#automake('nrwi', 500)
