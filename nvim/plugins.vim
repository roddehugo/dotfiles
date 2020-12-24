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
Plug 'joshdick/onedark.vim'

" editor
Plug 'editorconfig/editorconfig-vim' " maintain consistent coding styles
Plug 'itchyny/lightline.vim' " light and configurable statusline/tabline plugin
Plug 'airblade/vim-gitgutter' " git diff in the gutter and stages/reverts hunks
Plug 'lambdalisue/suda.vim' " fix :w !sudo tee % > /dev/null trick on neovim.

" tmux
Plug 'benmills/vimux' " tmux integration for vim
Plug 'christoomey/vim-tmux-navigator' " let vim open tmux buffer
Plug 'tmux-plugins/vim-tmux-focus-events' " autoread option work properly for terminal vim
Plug 'wellle/tmux-complete.vim' " autocompletion for visible strings in panes

" utilities
Plug 'neomake/neomake' " asynchronous linting and make framework
Plug 'sbdchd/neoformat' " code formating with several backends
Plug 'sheerun/vim-polyglot' " a solid language pack for Vim
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" enhancements
Plug 'ervandew/supertab' " perform all your vim insert mode completions with Tab
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-obsession' " continuously updated session files
Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with '.'
Plug 'tpope/vim-surround' " quoting/parenthesizing made simple
Plug 'raimondi/delimitmate' " automatic closing of quotes, parenthesis, brackets
Plug 'ntpeters/vim-better-whitespace' " highlights trailing whitespace
Plug 'aserebryakov/vim-todo-lists' " todo lists

" fuzzy searching
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy file finder and more

" markdown
Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " open markdown files in Marked.app

" python
Plug 'zchee/deoplete-jedi', { 'for': 'python' } " code completion for python

" c/cpp
Plug 'vim-scripts/a.vim' " switch between source files and header files
Plug 'octol/vim-cpp-enhanced-highlight' " enhance code highlight
Plug 'shougo/neoinclude.vim', { 'for': ['c', 'cpp'] } " completion for includes
Plug 'shougo/deoplete-clangx', { 'for': ['c', 'cpp'] } " completion for c and c++
Plug 'deoplete-plugins/deoplete-tag', { 'for': ['c', 'cpp'] } " completion for ctags

call plug#end()

" }}}
" {{{ Configuration

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" lightline
let g:lightline = {
            \ 'colorscheme': 'Tomorrow_Night',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'FugitiveHead'
            \ },
            \ }

" fzf
let g:fzf_layout = { 'down': '~30%' }
command! -bang GFilesRecurse call fzf#vim#gitfiles('--recurse-submodules')

" deoplete
let g:deoplete#enable_at_startup = 1

" tmux-complete
let g:tmuxcomplete#trigger = ''

" vim-todo-lists
let g:VimTodoListsMoveItems = 0
