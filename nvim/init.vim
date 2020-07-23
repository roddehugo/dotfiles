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

set ttyfast " faster redrawing
set clipboard=unnamed " use the OS clipboard by default
set encoding=utf-8 nobomb " use UTF-8 without BOM
set mouse=a " enable mouse in all modes

set modeline " respect modeline in files
set modelines=2 " only read the first two lines

set backupdir=~/.config/nvim/backups
set directory=~/.config/nvim/swaps
set undodir=~/.config/nvim/undo

set backupskip=/tmp/*,/private/tmp/*

" }}}
" {{{ Interface

set laststatus=2 " always show status line
set showtabline=2 " always show tab line
set showcmd " display the number of characters and lines in visual mode
set showmode " show the current mode
set synmaxcol=180 " only syntax first n characters

" ruler
set ruler " show row and column ruler information
set rulerformat=%=%h%m%r%w\ %(%c%V%),%l/%L\ %P

" line numbers
set number " show line numbers
set numberwidth=3 " set gutter width to n cols

" a - terse messages (like [+] instead of [Modified]
" t - truncate file names
" I - no intro message when starting vim fileless
" T - truncate long messages to avoid having to hit a key
set shortmess=atTI

" }}}
" {{{ Behavior

" switch cursor to line in insert mode
set guicursor=i:ver25-iCursor
" switch cursor to block in other modes
set guicursor+=n-v-c:block-nCursor
" switch off blinking in all mode
set guicursor+=a:blinkon0

" always activate spell corrections
set spell

" splits
set splitbelow
set splitright

" show results of substitution as they're happening
set inccommand=nosplit

" movements
set backspace=indent,eol,start " make backspace behave in a sane manner
set nostartofline " don’t reset cursor to start of line when moving around.
set scrolloff=5 " keep n lines below and above cursor.

" line breaking/wrapping
set wrap " turn on line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
set showbreak=↪\  " show at breaking (with extra space)
set textwidth=80 " set hard text wrapping (number of cols)
set colorcolumn=80 " display wrapping column
set formatoptions=tcrqj " format using textwidth, including comments and gq

" highlighting
set cursorline " highlight position of cursor
set showmatch " highlight matching brace
set mat=0 " how many tenths of a second to blink
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " highlight conflicts

" search
set magic " set magic on, for regex
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expression contains a capital letter
set hlsearch " highlight search results
set incsearch " set incremental search, like modern browsers
set gdefault " add the g flag to search/replace by default
set lazyredraw " don't redraw while executing macros

" visual bell and no error notification (no beeping)
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

" set custom mapleader
let mapleader=","

" set paste toggle
set pastetoggle=<leader>vv

" disable Ex mode
noremap <silent> Q <nop>

" enable . command in visual mode
vnoremap . :normal .<cr>

" remap VIM 0 to first non-blank character
nnoremap 0 ^

" tweak ESC to exit input and terminal mode
inoremap jk <ESC>
tnoremap jk <C-\><C-n>

" make use of ctags and cscope easier
noremap gt <C-]>

" fold/unfold map
noremap <space> za
noremap <c-space> zA

" switch between current and last buffer
noremap <leader>; <c-^>

" toggle highlight of current line
noremap <leader>cl :set cursorline! cursorline?<cr>

" toggle special characters display
noremap <leader>li :set list! list?<cr>

" toggle spelling
noremap <leader>sp :set spell! spell?<cr>

" toggle highlighted search
noremap <leader>hl :set hlsearch! hlsearch?<cr>

" wipeout buffer
noremap <leader>bb :bw<cr>

" fix trailing spaces in buffer
noremap <leader>ss :StripWhitespace<cr>

" remove the Windows ^M - when the encodings gets messed up
noremap <leader>mm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" refactor all file
noremap =f ggVG=

" refactor json file
noremap =j :%!python -m json.tool<cr>

" refactor with clang-format file
noremap =c :py3file /usr/local/share/clang/clang-format.py<cr>

" save a file as root (,W)
noremap <silent> <leader>W :w !sudo tee -S % > /dev/null<cr>

" switch CWD to the directory of the open buffer
noremap <silent> <leader>cd :cd %:p:h<cr>:pwd<cr>

" create parent directories
noremap <silent> <leader>md :call mkdir(expand('%:h'), 'p')<cr>

" edit vim config
noremap <leader>ev :e! ~/.config/nvim/init.vim<cr>
" edit git config
noremap <leader>eg :e! ~/.gitconfig<cr>
" edit tmux config
noremap <leader>et :e! ~/.tmux.conf<cr>
" edit bash config
noremap <leader>eb :e! ~/.bash.d/<cr>

" keep selection after indentation
vnoremap <silent> < <gv
vnoremap <silent> > >gv

" moving up and down work as you would expect
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
nnoremap <silent> <leader>+ :exe "resize " . (winheight(0) * 2)<cr>
nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 1/2)<cr>

" marked2 shortcuts
nnoremap <leader>mo :MarkedOpen!<cr>
nnoremap <leader>mq :MarkedQuit<cr>

" opens a new tab with the current buffer's path
" super useful when editing files in the same directory
nnoremap <leader>oe :e <C-R>=expand("%:p:h") . "/" <cr>
nnoremap <leader>ot :tabe <C-R>=expand("%:p:h") . "/" <cr>
nnoremap <leader>os :split <C-R>=expand("%:p:h") . "/" <cr>
nnoremap <leader>ov :vsplit <C-R>=expand("%:p:h") . "/" <cr>
nnoremap <leader>oc :e %<.c<cr>
nnoremap <leader>oC :e %<.cc<cr>
nnoremap <leader>oh :e %<.h<cr>
nnoremap <leader>oH :e %<.hh<cr>

" vimux runner
noremap <Leader>vp :VimuxPromptCommand<cr>
noremap <leader>vr :VimuxRunLastCommand<cr>
noremap <leader>vi :VimuxInspectRunner<cr>
noremap <Leader>vq :VimuxCloseRunner<cr>
noremap <leader>vc :VimuxInterruptRunner<cr>

" fuzzy searching
nnoremap <silent> <leader>c :Commits<cr>
nnoremap <silent> <leader>C :BCommits<cr>
nnoremap <silent> <leader>f :GFilesRecurse<cr>
nnoremap <silent> <leader>F :Files<cr>
nnoremap <silent> <leader>g :GFiles?<cr>
nnoremap <silent> <leader>G :Rg<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>t :Tags<cr>

" mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" cscope searching
" nmap <leader>ca :cs find a <C-R>=expand("<cword>")<cr><cr> " assignement
" nmap <leader>cc :cs find c <C-R>=expand("<cword>")<cr><cr> " fct calling
" nmap <leader>cd :cs find d <C-R>=expand("<cword>")<cr><cr> " fct called by
" nmap <leader>ce :cs find e <C-R>=expand("<cword>")<cr><cr> " egrep
" nmap <leader>cf :cs find f <C-R>=expand("<cfile>")<cr><cr> " file
" nmap <leader>cg :cs find g <C-R>=expand("<cword>")<cr><cr> " definition
" nmap <leader>ci :cs find i <C-R>=expand("<cfile>")<cr><cr> " files including
" nmap <leader>cs :cs find s <C-R>=expand("<cword>")<cr><cr> " C symbol
" nmap <leader>ct :cs find t <C-R>=expand("<cword>")<cr><cr> " text string

" relative path (src/foo.txt)
nnoremap <leader>cf :let @+=expand("%")<cr>
" absolute path (/something/src/foo.txt)
nnoremap <leader>cF :let @+=expand("%:p")<cr>
" filename (foo.txt)
nnoremap <leader>ct :let @+=expand("%:t")<cr>
" directory name (/something/src)
nnoremap <leader>ch :let @+=expand("%:p:h")<cr>

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

" insert today's date in journal format
command! Today call Today()
function! Today()
    exec "put =strftime('%m/%d/%a')"
endfunction

" return to last edit position when opening files
command! GotoLastKnownLine call GotoLastKnownLine()
function! GotoLastKnownLine()
  if line("'\"") > 0 && line("'\"") <= line("$")
    exe "normal! g`\""
  endif
endfunction

" enable shortcuts of cscope if a database is loaded
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

" enable shortcuts of LSP if a database is loaded
command! LSPShortcuts call LSPShortcuts()
function LSPShortcuts()
  nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
  nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()

" command to fold everything except what you searched for
command! -nargs=* Foldsearch
      \ if <q-args> != '' |
      \   exe "normal /".<q-args>."\<cr>" |
      \ endif |
      \ if @/ != '' |
      \   setlocal
      \     foldexpr=FoldRegex(v:lnum,@/,2)
      \     foldmethod=expr
      \     foldlevel=0 |
      \ endif

function! FoldRegex(lnum,pat,context)
  " get start/end positions for context lines
  let startline=a:lnum-a:context
  while startline < 1
    let startline+=1
  endwhile
  let endline=a:lnum+a:context
  while endline > line('$')
    let endline-=1
  endwhile

  let returnval = 2

  let pos=getpos('.')

  " search from current line to get matches ON the line
  call cursor(a:lnum, 1)
  let matchline=search(a:pat,'cW',endline)
  if matchline==a:lnum
    let returnval = 0
  elseif matchline > 0
    " if current line didn't match, there could have been a match within
    " trailing context lines
    let returnval = 1
  else
    " if no match at current line, search leading context lines for a match
    call cursor(startline, 1)
    let matchline=search(a:pat,'cW',a:lnum)
    if matchline > 0
      let returnval = 1
    endif
  endif

  call setpos('.',pos)

  return returnval
endfun

" }}}
" {{{ Autocommands

if has('autocmd') && !exists('autocommands_loaded')
  let autocommands_loaded = 1

  " Cscope
  " autocmd VimEnter * CScopeStart
  " autocmd FileType c,cpp CScopeShortcuts

  " StripWhitespace
  autocmd BufEnter * EnableStripWhitespaceOnSave

  autocmd BufReadPost * GotoLastKnownLine
  autocmd BufWritePost * Neomake
  " autocmd BufWritePost * Neoformat

  autocmd BufRead,BufNewFile Module set filetype=make
  autocmd BufRead,BufNewFile *.luaconf set filetype=lua
  autocmd BufRead,BufNewFile .notes set filetype=markdown
  autocmd BufRead,BufNewFile jrnl*.txt set filetype=journal

  autocmd FileType ld setlocal ts=8 sts=8 sw=8 noet
  autocmd FileType make setlocal ts=4 sts=4 sw=4 noet
  autocmd FileType c,cpp setlocal ts=4 sts=4 sw=4 et
  autocmd FileType markdown,textile setlocal spell
  autocmd FileType gitcommit setlocal tw=72 cc=72 spell
  autocmd FileType gitrebase setlocal tw=87 cc=87 nospell
  autocmd FileType todo setlocal spell ts=2 sts=2 sw=2 et nofoldenable
  autocmd FileType journal setlocal spell spelllang=fr tw=80 cc=80

  autocmd TermOpen * setlocal nospell
endif

" }}}
" {{{ Command line

" packadd termdebug
let g:termdebug_wide = 1

" smart mappings on the command line
cnoremap $h ~/
cnoremap $b ~/.bash.d/
cnoremap $d ~/Desktop/
cnoremap $p ~/Projects/
cnoremap $w ~/Workspaces/

" bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" }}}
