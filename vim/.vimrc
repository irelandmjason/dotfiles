filetype plugin indent on
syntax on
set secure

" Allows mouse usage, becasue im a heathen. 'a' == all.
" set mouse=a

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
" The Following is used for C (.c) files.
autocmd BufNewFile *.c 0r ~/skeletons/skeleton.c


" Allows for tab compelting syntax.
set omnifunc=ccomplete#Complete
set completeopt=longest,menuone
set noignorecase
" Highlighting for compeltion menu.
highlight Pmenu ctermbg=gray guibg=gray
highlight Pmenuthumb ctermbg=blue guibg=blue
highlight PmenuSbar ctermbg=black guibg=black
highlight PmenuSel ctermbg=blue guibg=blue
" Function for tab completion AND still use tabbing. Thanks Liam Echlin!
function! TabComplete()
	if !strlen(&omnifunc) || strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$' || exists(&paste)
		return "\<Tab>"
	else
		return "\<C-N>"
	endif
endfunction
inoremap <Tab> <C-R>=TabComplete()<CR>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
