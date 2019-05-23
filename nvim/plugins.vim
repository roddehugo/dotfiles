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
Plug 'wellle/tmux-complete.vim' " autocompletion for visible strings in panes
Plug 'tmux-plugins/vim-tmux-focus-events' " autoread option work properly for terminal vim

" utilities
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neomake/neomake' " syntastic using neovim's job control functonality
Plug 'mfulz/cscope.nvim' " cscope wrapper for neovim
Plug 'aserebryakov/vim-todo-lists' " todo lists

" enhancements
Plug 'ervandew/supertab' " perform all your vim insert mode completions with Tab
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - enhances surround
Plug 'tpope/vim-surround' " quoting/parenthesizing made simple
Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with '.'
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets
Plug 'vim-scripts/matchit.zip' " extended % matching
Plug 'ntpeters/vim-better-whitespace' " highlights trailing whitespace

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
Plug 'klen/python-mode', { 'for': 'python' } " python-mode. PyLint, Rope, Pydoc, breakpoints from box
Plug 'zchee/deoplete-jedi', { 'for': 'python' } " code completion for python

" lua
Plug 'tbastos/vim-lua', { 'for': 'lua' } " improved lua syntax and indentation

" c/cpp
Plug 'Shougo/neoinclude.vim' " completion for include files
Plug 'Rip-Rip/clang_complete' " code completion for c/cpp

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

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
" command! -bang -nargs=* Ggrep
"   \ call fzf#vim#grep(
"   \   'git grep --line-number '.shellescape(<q-args>), 0,
"   \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" will not override existing commands.
" command! -bang Colors
"   \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
" command! -bang -nargs=* Ag
"   \ call fzf#vim#ag(<q-args>,
"   \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"   \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview('up:60%')
"   \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \   <bang>0)

" Likewise, Files command with preview window
" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#enable_smart_case = 1
" let g:deoplete#omni#input_patterns.cpp = ['[^. *\t]\.\w*', '[^. *\t]\::\w*', '[^. *\t]\->\w*', '[<"].*/']

" Cscope
let g:cscope_dir = '~/.cscope'
let g:cscope_config = '.cscope_config'
let g:cscope_update_on_start = 1
let g:inccomplete_showdirs = 1

" Clang
let g:clang_auto_select = 0
let g:clang_complete_auto = 0
" let g:clang_complete_macros = 1
" let g:clang_complete_patterns = 1
" let g:clang_conceal_snippets = 0
let g:clang_make_default_keymappings = 0
let g:clang_omnicppcomplete_compliance = 0
let g:clang_snippets = 0
let g:clang_trailing_placeholder = 0
let g:clang_user_options = '-std=c++11'
let g:clang_library_path = '/usr/local/opt/llvm/lib/libclang.dylib'

" Tmux complete
let g:tmuxcomplete#trigger = ''

" Vim Todo List
let g:VimTodoListsMoveItems = 0
" }}}
