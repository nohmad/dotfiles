" Pathogen {{{
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()
" }}}

" Colors {{{
set t_Co=256                        " set number of colors
" colorscheme Tomorrow-Night-Eighties " Use Tomorrow-Night Theme
" }}}

inoremap `` <esc>
let mapleader= "," " Remap Leader to ,
map <leader>i mmgg=G`m<CR>

" UI {{{
syntax on           " turn on file syntax highlighting
set number          " show line numbers
set ruler           " show cursor position in bottom bar (vim-airline overrides)
"set cursorline      " visually show which line the cursor is on
set autoindent      " match indentation level when adding new lines
set showcmd         " show previous window command in bottom line
set laststatus=2    " Always display the last status
"set mouse=a         " Enable mouse in all 4 modes
set noerrorbells visualbell t_vb= " disable audio/visual messages for failed commands
set wildmenu        " Display menu when autocomplete hase more than 1 possible value
set wildignore+=*.o,*.obj,.git,*.pyc,parts,*.egg-info,node_modules,tmp,venv,build,resources,vendor,tags " list of things to not tab complete
set lazyredraw      " Only redraw when necessary (makes macros execute faster)
set showmatch       " highlight matching character for [{()}]
set winwidth=84     " when going into a window or split it will then take at least 84 columns of width
set winheight=5     " set winheight low to set winminheight
set winminheight=5  " minimum height allowed for a window
set winheight=999   " active window takes maximum height
set shell=/bin/zsh " use the proper path
set nocompatible    " make vim behave like vim and not vi
set list listchars=tab:»\ ,trail:· " set characters for trailing white space and <Tab> characters
filetype plugin indent on  " enable filetype indentation
highlight SpecialKey guifg=#FF003F " set color for hidden characters

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 0 " Airline configuration
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_branch_empty_message = ''
let g:airline_branch_prefix = ''
let g:airline_symbols.notexists = ''
let g:airline_enable_branch = 1
let g:airline_enable_bufferline = 0
let g:airline_enable_syntastic = 0
let g:airline_enable_tagbar = 0
"let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1


" Split lines (useful for correct spacing in javascript functions
imap <C-c> <CR><Esc>O

" Disable Execute Mode
nmap Q <Nop>
" }}}

" Text {{{
set encoding=utf-8    " set text ecoding to UTF-8
set smarttab          " insert and remove tab widths with <Tab> and <Backspace>
set expandtab         " insert spaces in place of tabs
set textwidth=0       " do not break lines when pasting
set tabstop=2         " number of visual spaces per <Tab>
set softtabstop=2     " number of spaces in <Tab> when editing
set shiftwidth=2      " how far to shift for new indentation level
set clipboard=unnamed " set system clipboard to the unnamed register, yank to clipboard
" }}}

" Search {{{
set incsearch       " start searching before hitting enter
set hlsearch        " highlight search results
set ignorecase      " case insensitive search (when searching with all lower case)
set smartcase       " if search has capital letter then be case sensitive
set backspace=indent,eol,start " set characters that can be backspaced over
set nogdefault      " use the standard /g end character to do global
" Toggle highlighting of search results
nnoremap <leader><space> :nohlsearch<cr>

" re-index ctags in current directory (recursive)
nmap <F4> :!ctags -R .<cr>
" }}}

" Backups {{{
set nobackup        " don't save backups
set nowritebackup   " don't create backups before overwriting a file
set noswapfile      " don't create a swapfile for buffers
" }}}

" Folding {{{
set foldenable         " enable code folding
set foldlevelstart=10  " have most folds open by default
set foldnestmax=10     " only allow up to 10 nested folds
set foldmethod=marker  " use syntax marker to delimit folds
" open fold under cursor with space
nnoremap <space> za
" }}}

" Navigation {{{
" Cycle through open buffers with <Tab> and <Shift>+<Tab>
map <Tab> :bn<CR>
map <S-Tab> :bp<CR>

" Kill current buffer without closing splits with ,x
nnoremap <leader>x :Bdelete<cr>

" Switch windows with ,C
map <leader><S-c> <C-w><C-w>

" CtrlP {{{
" Order file matches from bottom to top
let g:ctrlp_match_window = "bottom,order:btt"
" Always open new files in new buffers
let g:ctrlp_switch_buffer = 0
" Respect current working directory and don't change based on current buffer
let g:ctrlp_working_path_mode = 0
" Use ag for the searching so that it's not so slow
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" }}}

" Auto-complete {{{
" MULTIPURPOSE TAB KEY (taken from Gary Bernhardt)
" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
" either tab or smart complete depending on location
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" open wildmenu with Shift+Tab
inoremap <s-tab> <c-n>
" }}}

" Set up filetype specific commands
if has("autocmd")
  " Set filetype tab settings
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,coffee,sass,cucumber,stylus,css,xml,htmldjango set ai ts=2 sw=2 sts=2 et
  autocmd FileType python,doctest set ai ts=4 sw=4 sts=4 et
  autocmd FileType go set ai ts=2 sw=2 sts=2 noet

  " Set auto-complete settings for various file types
  autocmd FileType css,scss set omnifunc=csscomplete#CompleteCSS

  " Set Syntax Highlighting for odd file types
  au BufNewFile,BufRead *.ejs set filetype=jst
  au BufNewFile,BufRead *.json set filetype=json syntax=javascript
  au BufNewFile,BufRead *.md set filetype=markdown
  au BufNewFile,BufRead Makefile,.git*,.git/* set noexpandtab

  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
