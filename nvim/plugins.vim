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
Plug 'tmux-plugins/vim-tmux-focus-events' " autoread option work properly for terminal vim
Plug 'wellle/tmux-complete.vim' " autocompletion for visible strings in panes

" utilities
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neomake/neomake' " syntactic using
Plug 'sbdchd/neoformat' " code formating with several backends
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' } " gdb

" enhancements
Plug 'ervandew/supertab' " perform all your vim insert mode completions with Tab
Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with '.'
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-surround' " quoting/parenthesizing made simple
Plug 'raimondi/delimitmate' " automatic closing of quotes, parenthesis, brackets
Plug 'ntpeters/vim-better-whitespace' " highlights trailing whitespace
Plug 'aserebryakov/vim-todo-lists' " todo lists

" file searching
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more

" web development
" Plug 'mattn/emmet-vim', { 'for': 'html' } " emmet support for vim
" Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
" Plug 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html
" Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'html'] } " javascript support
" Plug 'leafgarland/typescript-vim', { 'for': 'typescript' } " typescript support
" Plug 'kchmck/vim-coffee-script', { 'for': 'typescript' } " coffeescript support
" Plug 'groenewege/vim-less', { 'for': 'less' } " less support
" Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
" Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support

" markdown
Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " open markdown files in Marked.app
Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support

" json
Plug 'elzr/vim-json', { 'for': 'json' } " Json support

" python
" Plug 'klen/python-mode', { 'for': 'python' } " python-mode. PyLint, Rope, Pydoc, breakpoints from box
Plug 'zchee/deoplete-jedi' " code completion for python

" lua
" Plug 'tbastos/vim-lua', { 'for': 'lua' } " improved lua syntax and indentation
" Plug 'xolox/vim-lua-ftplugin, { 'for': 'lua' } "file type plugin

" go
" Plug 'fatih/vim-go', { 'for': 'go' } " development plugin
" Plug 'deoplete-plugins/deoplete-go', { 'for': 'go', 'do': 'make'} " code completion
" Plug 'jodosha/vim-godebug', { 'for': 'go' } " debugging plugin

" c/cpp
Plug 'shougo/neoinclude.vim', { 'for': ['c', 'cpp']} " completion for includes
Plug 'shougo/deoplete-clangx', { 'for': ['c', 'cpp']} " completion for C/C++
" Plug 'roddehugo/cscope.nvim', { 'for': ['c', 'cpp']} " cscope wrapper

call plug#end()

" }}}
" {{{ Configuration

" Python
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

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

" Don't hide quotes in json files
let g:vim_json_syntax_conceal = 0

" FZF
let g:fzf_layout = { 'down': '~30%' }
command! -bang GFilesRecurse call fzf#vim#gitfiles('--recurse-submodules')

" Deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang'

" Cscope
let g:cscope_dir = '~/.cscope'
let g:cscope_config = '.cscope_config'
let g:cscope_update_on_start = 0

" Tmux complete
let g:tmuxcomplete#trigger = ''

" Vim Todo List
let g:VimTodoListsMoveItems = 0

" Neoinclude
if !exists('g:neoinclude#exts')
    let g:neoinclude#exts = {}
endif
let g:neoinclude#exts.cpp = ['', 'hh', 'h', 'hpp', 'hxx']
