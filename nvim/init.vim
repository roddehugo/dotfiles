" vim:foldmethod=marker:foldlevel=0
source ~/.config/nvim/plugins.vim
" {{{ General
set background=dark
colorscheme Tomorrow-Night

syntax on " enable syntax highlighting
filetype plugin indent on " let the filetype plugins do the work.
" }}}
" {{{ System
set viminfo^=% " remember info about open buffers on close

set nocompatible " not compatible with vi
set autoread " detect when a file is changed
set hidden " current buffer can be put into background

set history=1000 " change history length
set undolevels=1000 " number of undo levels

set title " show the filename in the window titlebar
set ttyfast " faster redrawing
set clipboard=unnamed " use the OS clipboard by default
set encoding=utf-8 nobomb " use UTF-8 without BOM
set mouse=a " enable mouse in all modes

set modeline " respect modeline in files
set modelines=2 " only read the first two lines

set backupdir=~/.vim-tmp,~/.tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,/tmp
set undodir=~/.vim-tmp,~/.tmp,/tmp
" }}}
" {{{ Interface
set laststatus=2 " always show status line
set showtabline=2 " always show tab line
set showcmd " display the number of (characters|lines) in visual mode
set showmode " show the current mode

" ruler
set ruler " show row and column ruler information
set rulerformat=%=%h%m%r%w\ %(%c%V%),%l/%L\ %P

" line numbers
" set relativenumber " relative line numbers
set number " show line numbers
set numberwidth=3 " set gutter width to n cols

" a - terse messages (like [+] instead of [Modified]
" t - truncate file names
" I - no intro message when starting vim fileless
" T - truncate long messages to avoid having to hit a key
set shortmess=atTI
" }}}
" {{{ Behavior
" switch cursor to line in insert mode, and block when not
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" splits
set splitbelow
set splitright

" show results of substitution as they're happening
set inccommand=nosplit

" movements
set backspace=indent,eol,start " make backspace behave in a sane manner
set nostartofline " don’t reset cursor to start of line when moving around.
set scrolloff=5 "keep n lines below and above cursor.

" line breaking/wrapping
set wrap " turn on line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
set showbreak=↪\ " show at breaking
set textwidth=80 " set hard text wrapping (number of cols)
set colorcolumn=80 " display wrapping column
set formatoptions=crq " format using textwidth, including comments and gq

" highlighting
set cursorline " highlight position of cursor
set showmatch " highlight matching brace
set mat=2 " how many tenths of a second to blink
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " hightlight conflicts

" search
set magic  " set magic on, for regex
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch " highlight search results
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros
set gdefault " add the g flag to search/replace by default

" visual bell (no beeping)
set noerrorbells
set visualbell

" indentation
set autoindent " automatically set indent of new line
set smartindent " automatically inserts one extra level of indentation
set cindent " like smartindent but stricter and more customisable

" toggle invisible characters
set list
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮

" tabulation
set expandtab " insert tabs rather than spaces for <Tab>
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

" autocompletion
set completeopt=menu
set completeopt+=longest " complete files like a shell
set wildmenu " enhanced command line completion
set wildmode=longest,full " complete files like a shell
set pumheight=8 " max items in popup menu
set wildignore=*.o,*~,*.pyc,.git\*,.hg\*,.svn\*,.meteor

" code folding
set foldenable " fold by default
set foldlevel=0 " fold all levels by default
set foldcolumn=1 " sets the width for a gutter column
set foldmethod=indent " fold based on indent
set foldnestmax=6 " deepest fold

" cscope tags
" a: places where this symbol is assigned a value
" c: functions calling this function
" d: functions called by this function
" e: this egrep pattern
" f: this file
" g: this definition
" i: files #including this file
" s: this C symbol
" t: this text string
set cscopetag " always search cscope database on ctags commands
set csverb " always display info when new database added
set csto=0 " always search cscope and then ctags
set cspc=3 " how many components of a file's path to display
" '+' indicates that results must be appended to quickfix window,
" '-' implies previous results clearance, '0' or absence - don't use quickfix
" set cscopequickfix=a-,c-,d-,e-,f-,g-,i-,s-,t-
" set nocsverb " no verbosity for the default loading
" }}}
" {{{ Mappings
let mapleader=","

" set paste toggle
set pastetoggle=<leader>vv

" disable Ex mode
noremap <silent> Q <nop>

" enable . command in visual mode
vnoremap . :normal .<cr>

" remap VIM 0 to first non-blank character
nnoremap 0 ^

" tweak ESC to be 'jk' typed fast
inoremap jk <ESC>

" make use of ctags and csope easier
noremap gt <C-]>

" fold/unfold map
noremap <space> za
noremap <c-space> zA

" toggle curet or line
nnoremap <leader>i :set cursorline!<cr>

" toggle special characters
nnoremap <leader>l :set list! list?<cr>

" toggle highlighted search
noremap <leader><space> :set hlsearch! hlsearch?<cr>

" wipout buffer
nnoremap <leader>bb :bw<cr>

" fix trailing spaces in buffer
noremap <leader>ss :StripWhitespace<CR>

" remove the Windows ^M - when the encodings gets messed up
noremap <leader>mm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" refactor all file
noremap <leader>= ggVG=

" switch between current and last buffer
nnoremap <leader>; <c-^>

" save a file as root (,W)
noremap <silent> <leader>W :w !sudo tee % > /dev/null<CR>

" switch CWD to the directory of the open buffer
noremap <silent> <leader>cd :cd %:p:h<cr>:pwd<cr>

" edit vim config
noremap <leader>ev :e! ~/.config/nvim/init.vim<cr>
" edit git config
noremap <leader>eg :e! ~/.gitconfig<cr>
" edit tmux config
noremap <leader>et :e! ~/.tmux.conf<cr>

" keep selection after indentation
vnoremap <silent> < <gv
vnoremap <silent> > >gv

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" disable arrow keys in escape mode
map <silent> <up> <nop>
map <silent> <down> <nop>
map <silent> <left> <nop>
map <silent> <right> <nop>

" disable arrow keys in insert mode
imap <silent> <up> <nop>
imap <silent> <down> <nop>
imap <silent> <left> <nop>
imap <silent> <right> <nop>

" scroll the viewport faster
nnoremap <silent> <C-e> 3<C-e>
nnoremap <silent> <C-y> 3<C-y>

" helpers for dealing with other people's code
nnoremap \t4 :set ts=4 sts=4 sw=4 noet<cr>
nnoremap \t2 :set ts=2 sts=2 sw=2 noet<cr>
nnoremap \s4 :set ts=4 sts=4 sw=4 et<cr>
nnoremap \s2 :set ts=2 sts=2 sw=2 et<cr>

" smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l
nnoremap <silent> <leader><C-h> :call WinMove('h')<cr>
nnoremap <silent> <leader><C-j> :call WinMove('j')<cr>
nnoremap <silent> <leader><C-k> :call WinMove('k')<cr>
nnoremap <silent> <leader><C-l> :call WinMove('l')<cr>

" easy window resizing x2
nnoremap <silent> <leader>+ :exe "resize " . (winheight(0) * 2)<CR>
nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 1/2)<CR>

" marked2 shortcuts
nnoremap <leader>mo :MarkedOpen!<cr>
nnoremap <leader>mq :MarkedQuit<cr>

" opens a new tab with the current buffer's path
" super useful when editing files in the same directory
nnoremap <leader>oe :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>ot :tabe <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>os :split <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>ov :vsplit <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>oc :e %<.c<CR>
nnoremap <leader>oC :e %<.cc<CR>
nnoremap <leader>oh :e %<.h<CR>
nnoremap <leader>oH :e %<.hh<CR>

" vimux runner
noremap <Leader>vp :VimuxPromptCommand<CR>
noremap <leader>vl :VimuxRunLastCommand<CR>
noremap <leader>vi :VimuxInspectRunner<CR>
noremap <Leader>vq :VimuxCloseRunner<CR>
noremap <leader>vs :VimuxInterruptRunner<CR>

" fuzzy searching
if isdirectory(".git") || filereadable(".git")
  nnoremap <silent> <leader>c :Commit<cr>
  nnoremap <silent> <leader>f :GFiles<cr>
  nnoremap <silent> <leader>g :GFiles?<cr>
else
  nnoremap <silent> <leader>f :Files<cr>
endif
nnoremap <silent> <leader>b :Buffers<cr>

" insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" cscope searching
nmap <leader>ca :cs find a <C-R>=expand("<cword>")<CR><CR>   " assignement
nmap <leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>   " fct calling
nmap <leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>   " fct called by
nmap <leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>   " egrep
nmap <leader>cf :cs find f <C-R>=expand("<cfile>")<CR><CR>   " file
nmap <leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>   " definition
nmap <leader>ci :cs find i <C-R>=expand("<cfile>")<CR><CR>   " files including
nmap <leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>   " C symbol
nmap <leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>   " text string
" }}}
" {{{ Functions
" window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

" return to last edit position when opening files
command! GotoLastKnownLine call GotoLastKnownLine()
function! GotoLastKnownLine()
  if line("'\"") > 0 && line("'\"") <= line("$")
    exe "normal! g`\""
  endif
endfunction

" enable shortcuts of cscope is on
command! CScopeShortcuts call CScopeShortcuts()
function! CScopeShortcuts()
  if len(split(execute('cscope show'), '\n')) > 1
    nmap ga <leader>ca
    nmap gd <leader>cg
    nmap gf <leader>cf
    nmap gi <leader>ci
    nmap gs <leader>cs
  endif
endfunction
" }}}
" {{{ Autocommands
if has('autocmd') && !exists('autocommands_loaded')
  let autocommands_loaded = 1
  autocmd VimEnter * CScopeStart

  autocmd BufEnter * CScopeShortcuts
  autocmd BufEnter * EnableStripWhitespaceOnSave
  autocmd BufReadPost * GotoLastKnownLine
  autocmd BufWritePost * Neomake

  autocmd BufRead,BufNewFile Module set filetype=make
  autocmd BufRead,BufNewFile *.luaconf set filetype=lua
  autocmd BufRead,BufNewFile *.vue set filetype=html
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noet
  autocmd FileType c,cpp setlocal ts=4 sts=4 sw=4 et omnifunc=clang_complete#ClangComplete
  autocmd FileType markdown,textile,gitcommit setlocal spell
  autocmd FileType gitcommit setlocal tw=72 cc=72
  autocmd FileType gitrebase setlocal tw=87 cc=87
  autocmd FileType todo setlocal spell foldmethod=marker foldlevel=0
endif
" }}}
" {{{ Command line
" smart mappings on the command line
cnoremap $h ~/
cnoremap $c ./
cnoremap $b ~/.bash.d/
cnoremap $d ~/Desktop/
cnoremap $w ~/Workspaces/
cnoremap $s ~/Sites/

" bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
" }}}
