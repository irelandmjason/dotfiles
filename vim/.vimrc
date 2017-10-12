filetype plugin indent on
syntax on
set secure

" Sets encoding to utf-8.
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" Get rid of backups and swaps.
set nobackup nowritebackup noswapfile
set autoread

" Sets numbered lines.
set number

" Highlight the current line.
set cursorline

" Sets search options.
set incsearch hlsearch ignorecase smartcase

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

" Highlights characters past the 79 character limit.
autocmd BufEnter * highlight OverLength ctermbg=darkgrey ctermfg=red
autocmd BufEnter * match OverLength /\%79v.*/

" Show space errors and trailing whitespace.
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red 
autocmd Syntax * syn match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Maps U to 'undo the undo'.
noremap U <C-R>

" Sets colorscheme for vim.
set background=dark
colorscheme industry


" The following is used for Python3 and Python3 (.py) files.
autocmd BufNewFile *.py 0r ~/skeletons/skeleton.py
