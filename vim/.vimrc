filetype plugin indent on
syntax on

" Sets encoding to utf-8.
set encoding=utf-8

" Sets numbered lines.
set number

" Sets search completion.
set incsearch
" Highlights what what is search for.
set hlsearch

" Sets indent structure.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set modeline
set fileformat=unix

" Sets file format structure.
set foldmethod=indent
set foldlevel=99
set textwidth=79

" Maps U to 'undo the undo'.
noremap U <C-R>

" Sets colorscheme for vim.
set background=dark
colorscheme industry

" The following is used for Python3 and Python3 (.py) files.

autocmd BufNewFile *.py 0r /skeletons/skeleton.py
