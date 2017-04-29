" vim:foldmethod=marker:foldlevel=0
" {{{ Plugin Manager
" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif
" }}}
" {{{ Plugins
call plug#begin('~/.config/nvim/plugged')

" colorschemes
Plug 'flazz/vim-colorschemes'

" editor
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'airblade/vim-gitgutter' " vim plugin which shows a git diff in the gutter and stages/reverts hunks

" tmux
Plug 'benmills/vimux' " tmux integration for vim
Plug 'christoomey/vim-tmux-navigator' " let vim open tmux buffer

" utilities
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' " file drawer
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neomake/neomake' " syntastic using neovim's job control functonality
Plug 'mfulz/cscope.nvim' " cscope wrapper for neovim

" enhancements
Plug 'ervandew/supertab' " perform all your vim insert mode completions with Tab
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - enhances surround
Plug 'tpope/vim-obsession' " continuously updated session files
Plug 'tpope/vim-surround' " quoting/parenthesizing made simple
Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with '.'
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'AndrewRadev/splitjoin.vim' " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
Plug 'vim-scripts/matchit.zip' " extended % matching
Plug 'ntpeters/vim-better-whitespace' " highlights trailing whiteSpace in red and provides :StripWhitespace to fix it

" file searching
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more
Plug 'mileszs/ack.vim' " search inside files using ack. Same as command line ack utility, but use :Ack

" web development
Plug 'mattn/emmet-vim', { 'for': 'html' } " emmet support for vim
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
Plug 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'html'] } " javascript support
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' } " typescript support
Plug 'kchmck/vim-coffee-script', { 'for': 'typescript' } " coffeescript support
Plug 'groenewege/vim-less', { 'for': 'less' } " less support
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support

" markdown
Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " open markdown files in Marked.app
Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support

" json
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support

" python
Plug 'klen/python-mode' " python-mode. PyLint, Rope, Pydoc, breakpoints from box.

" Lua
Plug 'tbastos/vim-lua' " improved lua syntax and indentation

call plug#end()
" }}}
" {{{ Configuration
" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" PyMode
let g:pymode_options_max_line_length = 120
let g:pymode_breakpoint_cmd = "import ipdb; ipdb.set_trace() ### XXX BREAKPOINT"

" Pymode Rope
let g:pymode_rope = 0
let g:pymode_rope_autoimport = 1
let g:pymode_rope_lookup_project = 1
let g:pymode_rope_goto_definition_bind = "<C-]>"

" Pymode Lint
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_lint_options_pylint = {'max-line-length': g:pymode_options_max_line_length}
let g:pymode_lint_on_write = 1

" Pymode Virtualenv
let g:pymode_virtualenv = 1

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['^\vendor$', '^\.meteor$', '\.pyc$', '^\.bundle$', '^\.bzr$', '^\.git$', '^\.hg$', '^\.sass-cache$', '^\.svn$', '^\.$', '^\.\.$']

" Don't hide quotes in json files
let g:vim_json_syntax_conceal = 0

" FZF
let g:fzf_layout = { 'down': '~30%' }

" Deoplete.
let g:deoplete#enable_at_startup = 1

" Cscope
" Path to store the cscope files (cscope.files and cscope.out)
let g:cscope_dir = '~/.cscope'

" Map the default keys on startup
" These keys are prefixed by CTRL+\ <cscope param>
" A.e.: CTRL+\ d for goto definition of word under cursor
let g:cscope_map_keys = 1

" Update the cscope files on startup of cscope.
let g:cscope_update_on_start = 1
" }}}
