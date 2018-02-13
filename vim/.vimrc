filetype off
syntax enable
set nocompatible              " Be iMproved, required
filetype off                  " Required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" Keep Plugin commands between vundle#begin/end.
call vundle#begin()
" Alternatively, pass a path where Vundle should install plugins
" Call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" ------
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
" https://github.com/kien/ctrlp.vim
" Run :CtrlP or :CtrlP [starting-directory] to invoke CtrlP in find file mode.
" Run :CtrlPBuffer or :CtrlPMRU to invoke CtrlP in find buffer or find MRU file
" mode.
" Run :CtrlPMixed to search in Files, Buffers and MRU files at the same time.
" Press <c-f> and <c-b> to cycle between modes.
" Press <c-d> to switch to filename only search instead of full path.
" Press <c-r> to switch to regexp mode.
" Use <c-j>, <c-k> or the arrow keys to navigate the result list.
" Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new
" split.
" Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
" Use <c-y> to create a new file and its parent directories.
" Use <c-z> to mark/unmark multiple files and <c-o> to open them.
Plugin 'kien/ctrlp.vim'

" The NERDTree is a file system explorer for the Vim editor.
" https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" draw a nice statusline at the bottom of each window.
" | A | B |             C               X | Y | Z |  [...]|
" section   meaning (example)
" A         displays the mode + additional flags like crypt/spell/paste (INSERT)
" B         VCS information (branch, hunk summary) (master)
" C         filename + read-only flag (~/.vim/vimrc RO)
" X         filetype (vim)
" Y         file encoding[fileformat] (utf-8[unix])
" Z         current position in the file
" [...]     additional sections (warning/errors/statistics) from external plugins
"           (e.g. YCM, syntastic, ...)
" The information in Section Z looks like this:
"
" 10% ☰ 10/100 ln : 20
"
" This means:
"
" 10%     - 10 percent down the top of the file
" ☰ 10    - current line 10
" /100 ln - of 100 lines
" : 20    - current column 20i
Plugin 'vim-airline/vim-airline'
" Syntastic is a syntax checking plugin for Vim created by Martin Grenfell.
" It runs files through external syntax checkers and displays any resulting errors to the user.

Plugin 'vim-syntastic/syntastic'
" Best Git wrapper of all time
" View any blob, tree, commit, or tag in the repository with :Gedit (and :Gsplit, :Gvsplit, :Gtabedit, ...). Edit a file in the index and write to it to stage the changes.
" Use :Gdiff to bring up the staged version of the file side by side with the working tree version and use Vim's diff handling capabilities to stage a subset of the file's changes.
" Bring up the output of git status with :Gstatus. Press - to add/reset a file's changes, or p to add/reset --patch.
" Guess what :Gcommit does!
" :Gblame brings up an interactive vertical split with git blame output.
" Press enter on a line to edit the commit where the line changed, or o to open it in a split.
" When you're done, use :Gedit in the historic buffer to go back to the work tree version.
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'

" Provides keyword completion system by maintaining a cache of keywords in the current buffer.
Plugin 'Shougo/neocomplcache.vim'
" ------
" All of your Plugins must be added before the following line.
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ============================================================================

" DIS.
syntax on
set secure
colorscheme pablo

" Allows mouse usage, becasue im a heathen. 'a' == all.
set mouse=a

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
set expandtab
set autoindent
set modeline
set tabstop=4
set shiftwidth=4
set softtabstop=4
set fileformat=unix

" Sets file format structure.
set foldmethod=indent
set foldlevel=80
set textwidth=79

" Highlights characters past the 79 character limit.
autocmd BufEnter * highlight OverLength ctermbg=black ctermfg=red
autocmd BufEnter * match OverLength /\%79v.*/

" Colors!
" highlight MatchParen cterm=bold ctermbg=none ctermfg=6
" highlight MatchParen cterm=none ctermbg=none ctermfg=202

" Show space errors and trailing whitespace.
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Set colors for tabs.
highlight TabLineFill ctermfg=0 guifg=black
highlight TabLine ctermbg=0 guibg=black
highlight TabLineSel ctermbg=2 guibg=red

" Highlighting for compeltion menu.
highlight Pmenu ctermbg=gray guibg=gray
highlight Pmenuthumb ctermbg=blue guibg=blue
highlight PmenuSbar ctermbg=black guibg=black
highlight PmenuSel ctermbg=blue guibg=blue

" Basic syntax based color scheming.
highlight Comment cterm=italic ctermbg=black ctermfg=202
highlight Constant ctermbg=black ctermfg=39
highlight Normal ctermbg=black ctermfg=15
highlight NonText ctermbg=black ctermfg=0
highlight Special ctermbg=black ctermfg=50
highlight Cursor ctermbg=black ctermfg=8



" NERDTree
" ============================================================================
" open a NERDTree automatically when vim starts up.
autocmd vimenter * NERDTree

" open a NERDTree automatically when vim starts up if no files were specified.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open NERDTree automatically when vim starts up on opening a directory.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" shortcut to open NERDTree.
map <C-n> :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" change default arrows.
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" config custom symbols.
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" show ignored status. 1 on. 0 off.
let g:NERDTreeShowIgnoredStatus = 1  " Heavy feature. May cost much more time.
" ============================================================================


" Syntastic
" ============================================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_w = 1
" ============================================================================

" NeoComlCache
" ============================================================================
" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" ============================================================================

" Remap Split window navigation.
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

" Maps U to 'undo the undo'.
noremap U <C-R>

" Remap '[' and ']' to switch between tabs. 'tabe' for tabs.
noremap ] gt
noremap [ gT

" The following is used for Python3 and Python3 (.py) files.
autocmd BufNewFile *.py 0r ~/skeletons/skeleton.py
" The Following is used for C (.c) files.
autocmd BufNewFile *.c 0r ~/skeletons/skeleton.c
" The Following is used for C header (.h) files.
autocmd BufNewFile *.h 0r ~/skeletons/skeleton.h

" Allows for tab compelting syntax.
" set omnifunc=ccomplete#Complete
" set completeopt=longest,menuone
" set noignorecase

" Function for tab completion AND still use tabbing. Thanks Liam Echlin!
" function! TabComplete()
" 	if !strlen(&omnifunc) || strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$' || exists(&paste)
" 		return "\<Tab>"
" 	else
" 		return "\<C-N>"
" 	endif
" endfunction
" inoremap <Tab> <C-R>=TabComplete()<CR>
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
