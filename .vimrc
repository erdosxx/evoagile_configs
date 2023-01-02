" Disable file type detection for Vundle package manager
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

" following setup is accroding to this
" https://realpython.com/vim-and-python-a-match-made-in-heaven/
" ------------- Vim-Plug Plugins --------------

call plug#begin()

Plug 'tmhedberg/SimpylFold'
" Preview docstring in fold text
let g:SimpylFold_docstring_preview=1

Plug 'Konfekt/FastFold'
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:markdown_folding = 1
let g:rst_fold_enabled = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:zsh_fold_enable = 1
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1
let g:fortran_fold=1
let g:clojure_fold = 1
let g:baan_fold=1
autocmd FileType c,cpp setlocal foldmethod=syntax

" This indentation script for python tries to match more closely what is
" suggested in PEP 8
Plug 'vim-scripts/indentpython.vim'

Plug 'ycm-core/YouCompleteMe', {'do': function('BuildYCM')}
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" generate a .ycm_extra_conf.py file for use with YouCompleteMe
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

" ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax checking
" and semantic errors)
Plug 'dense-analysis/ale'
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
" https://vi.stackexchange.com/questions/2350/how-to-map-alt-key
" M = Alt
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
nmap <silent> <M-k> <Plug>(ale_previous_wrap)
nmap <silent> <M-j> <Plug>(ale_next_wrap)

" To run flake8 lint press <F7>
Plug 'nvie/vim-flake8'

Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

" To open file window :NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim
" <c-p> or :CtrlP to start
Plug 'ctrlpvim/ctrlp.vim'

" Fugitive is the premier Vim plugin for Git.
Plug 'tpope/vim-fugitive'
" Extend fugitive.vim to support Bitbucket URLs in :GBrowse
Plug 'tommcdo/vim-fubitive'
" Extend fugitive.vim to support Github URLs in :GBrowse
Plug 'tpope/vim-rhubarb'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='badwolf'
"let g:airline_theme='zenburn'
let g:airline_powerline_fonts = 1
" Remove tab line.
let g:airline#extensions#tabline#enabled = 1
" let g:zenburn_high_Contrast = 1

" Cursor shape change in insert and replace mode
Plug 'wincent/terminus'

" Format code with one button press (or automatically on save)
Plug 'vim-autoformat/vim-autoformat'
noremap <F9> :Autoformat<CR>
autocmd BufWrite * :Autoformat
" Plug 'psf/black'
" jnnoremap <F9> :Black<CR>
" autocmd BufWritePre *.py execute ':Black'

Plug 'jupyter-vim/jupyter-vim'
" to allow(=1, disallow=0) to change the default keybindings
let g:jupyter_mapkeys = 0

" REPL for Clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Static Vim support for Leiningen, Boot, and the Clojure CLI.
Plug 'tpope/vim-salve', { 'for': 'clojure' }

" showing diff level of parentheses in diff color
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" vim plugin for cljfmt, the code formatting tool for Clojure(Script)
Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }

" filetype and syntax plugin for LaTeX files
Plug 'lervag/vimtex', { 'for': 'tex' }
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" ultimate solution for snippets in Vim
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" All of your Plugins must be added before the following line
call plug#end()
" ---------------------------------------------------

" for switching between a dark and light Solarized theme
call togglebg#map("<F5>")

" allow backspacing over everything in insert mode
" Ref: https://til.hashrocket.com/posts/f5531b6da0-backspace-options
set backspace=indent,eol,start

set autoindent      " always set autoindenting on
set nobackup        " do not keep a backup file, use versions instead
set history=200     " keep 200 lines of command line history
set showcmd         " display incomplete commands
set incsearch       " do incremental searching

set tabstop=4
" In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
set expandtab
" Number of spaces to use for each step of (auto)indent.  Used for
" 'cindent', >>, <<, etc.
set shiftwidth=2

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
" if t_Co(number of color) is more than 2
if &t_Co > 2 || has("gui_running")
  syntax on
  " When there is a previous search pattern, highlight all its matches.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 79 characters.
  autocmd FileType text setlocal textwidth=79

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " See :h 05.2
  " !~# regrexp doesn't match with case
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") &&
        \ &ft !~# 'commit'
        \ |  exe "normal g`\""
        \ | endif
endif " has("autocmd")

filetype plugin on
" grep print -n: line number and -H: file name.
set grepprg=grep\ -nH\ $*

:setlocal spell spelllang=en

" When on, splitting a window will put the new window below the current one.
set splitbelow
" When on, splitting a window' will put the new window right of the current one.
set splitright

" Enable folding
" Lines with equal indent form a fold.
set foldmethod=indent
" When open a file, open all folds, regardless of method used for folding.
" With foldlevel=0 all folded, foldlevel=1 only somes, ... higher numbers will
" close fewer folds.
set foldlevel=99

set encoding=utf-8

" set relative line number, rnu
set number relativenumber

" to ensuring aligned indentation
" For more detail, see following.
" https://vimtricks.com/p/ensuring-aligned-indentation/
set shiftround

" show matching brace
" See: https://vimtricks.com/p/vimtrick-highlight-matching-bracket/
set showmatch matchtime=3

autocmd BufNewFile,BufRead *.js, *.html, *.css
      \   set tabstop=2 softtabstop=2 shiftwidth=2

"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" cut and paste from or to other application
set clipboard=unnamed

" ------------- Mapping --------------
"
:let mapleader = "-"
:let maplocalleader = "\\"

" Don't use Ex mode, use Q for formatting
" gq: apply format, such as line width for that area.
" For example, :setlocal tw=N
" See: https://www.vim.org/scripts/script.php?script_id=4924
noremap Q gq
" move current line to up
noremap <leader>_ :m-2<CR>
" move current line to down
noremap <leader>- ddp
" change word to upper case in insert mode.
inoremap <leader><c-u> <Esc>lviwUwi
" change word to upper case in insert mode.
noremap <leader><c-u> viwUw
" Edit $MYVIMRC in vertical split window
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
" Read and apply $MYVIMRC
nnoremap <leader>sv :source $MYVIMRC<CR>
" Edit $MYURXVTRC in vertical split window
nnoremap <leader>uv :vsplit $MYURXVTRC<CR>
" Read and apply $MYURXVTRC
nnoremap <leader>su !xrdb $HOME/.Xresources<CR>
" auto correct and -> and, what -> what, then -> then
:iabbrev adn and
:iabbrev waht what
:iabbrev tehn then
" @@ -> norel.evoagile@gmail.com
:iabbrev @@ norel.evoagile@gmail.com
" ccopy -> Copyright 2023 Norel Oh, all rights reserved.
:iabbrev ccopy Copyright 2023 Norel Oh, all rights reserved.
" ssig ->
" ----------
" Norel Oh
" norel.evoagile@gmail.com
:iabbrev ssig ----------<cr>Norel Oh<cr>norel.evoagile@gmail.com
" Add " to start and end of word. Ex) word -> "word"
:nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
:vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
" Add ' to start and end of word. Ex) word -> 'word'
:nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
:vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
" Go to the beginning of the current line
:nnoremap H ^
" Go to the end of the current line
:nnoremap L $
" jk for escape from insert mode
:inoremap jk <esc>
" disable <esc> to escape from insert mode
:inoremap <esc> <nop>
:autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
:autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
:autocmd FileType html :iabbrev <buffer> --- &mdash;

" cin@: change email address in backword. See help: pattern-overview
:onoremap in@ :<c-u>execute
      \ "normal! ?\\<\\S\\+@\\w\\+\\.[a-zA-Z]\\{2,3}\\>\r:nohlsearch\rvg_"<cr>

augroup filetype_python
  " prevent defining sample autocmds multiple times
  autocmd!
  " comment line for python
  autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
  autocmd FileType python :iabbrev <buffer> iff if:<left>
  autocmd FileType python :iabbrev <buffer> rt return<right>
  " disable return input for training shortcut
  autocmd FileType python :iabbrev <buffer> return NOPENOPENOPE
  autocmd FileType python let g:black_linelength = 79
  autocmd FileType python setlocal foldmethod=indent
  autocmd BufNewFile,BufRead *.py
        \   set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79
        \   expandtab autoindent fileformat=unix |
        \   let python_highlight_all=1
  " define area of inside of parenthesis for movement
  autocmd FileType python onoremap p i(
  " define area of return block for movement
  " :db use this to delete statements until return
  autocmd FileType python onoremap b /return<cr>
  " define upcomming(f) area with perethsis ()
  autocmd FileType python onoremap in( :<c-u>normal! f(vi(<cr>
  " define upcomming(f) area with curly branket {}
  autocmd FileType python onoremap in{ :<c-u>normal! f{vi{<cr>
  " define previous(F) area with perethsis ()
  autocmd FileType python onoremap il( :<c-u>normal! F)vi(<cr>
  " define previous(F) area with curly branket {}
  autocmd FileType python onoremap il{ :<c-u>normal! F}vi}<cr>
  " For jupyter-vim package: key binding to execute range of codes
  " and put cursor to last position of virtual selection afterward.
  autocmd FileType python vnoremap <buffer> <silent>
        \ <localleader>e :JupyterSendRange<cr> :<c-u>normal! `><cr>
augroup END

augroup filetype_markdown
  " prevent defining sample autocmds multiple times
  autocmd!
  " backword search(?) to replace title with ==... or --...
  autocmd FileType markdown onoremap <buffer> ih :<c-u>execute
        \ "normal! ?^\\(==\\+\\\\|--\\+\\)$\r:nohlsearch\rkvg_"<cr>
  " backword search(?) to replace title and underline with ==... or --...
  autocmd FileType markdown onoremap <buffer> ah :<c-u>execute
        \ "normal! ?^\\(==\\+\\\\|--\\+\\)$\r:nohlsearch\rg_vk0"<cr>
augroup END


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" define current_reg with latest selected area
" and delete the area and paste in that position with
" the preview current_reg value.
" gv: select previously highlighted visual area
" s: delete the characters under range and change to Insert mode
" Ref: https://stackoverflow.com/questions/10862457/what-does-c-r-means-in-vim
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
" see :h "_: Black hole register
" vnoremap p "_dp

" Enable folding with the spacebar
nnoremap <space> za
