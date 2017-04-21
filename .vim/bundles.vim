set nocompatible
filetype off


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'



"-------------------------------------------------------------
" Code Completion
"-------------------------------------------------------------

"   neocomplcache. Note: It is not maintained well. You should use neocomplete 
"   instead.
"Plugin 'Shougo/neocomplcache'

"   It provides keyword completion system by maintaining a cache of keywords in
"   the current buffer. neocomplete can be customized easily and has many more
"   features than Vim's built-in completion. neo     complete requires Vim
"   7.3.885+ compiled with if_lua. If :echo has("lua") returns 1, then you're
"   done; otherwise, Mac: brew install vim --with-lua; Ubuntu: apt-get install
"   vim-nox;
Plugin 'Shougo/neocomplete'

"   The Neosnippet plug-In adds snippet support to Vim. Snippets are small
"   templates for commonly used code that you can fill in on the fly.
"   neocomplcache/neocomplete is not required to use neosnippet, but it's
"   highly recommended.
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

"   This library provides some utility functions. There isn't much need to 
"   install it unless another plugin requires you to do so.
"Plugin 'tomtom/tlib_vim'

"   This repository contains snippets files for various programming languages.
"   It is community-maintained and many people have contributed snippet files and
"   other improvements already.
Plugin 'honza/vim-snippets'
"Plugin 'garbas/vim-snipmate'

"   Supertab is a vim plugin which allows you to use <Tab> for all your insert
"   completion needs (:help ins-completion).
"Plugin 'ervandew/supertab'

"   emmet-vim is a vim plug-in which provides support for expanding abbreviations
"   similar to emmet.
"Plugin 'mattn/emmet-vim'

"   YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine for
"   Vim.
"Plugin 'Valloric/YouCompleteMe'



"-------------------------------------------------------------
" Surrounding Operation
"-------------------------------------------------------------

"   This plug-in provides automatic closing of quotes, parenthesis, brackets, etc.
Plugin 'Raimondi/delimitMate'

"   Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML
"   tags, and more. The plugin provides mappings to easily delete, change and
"   add such surroundings in pairs.
Plugin 'tpope/vim-surround'



"-------------------------------------------------------------
" Code Reading
"-------------------------------------------------------------

"   The NERD tree allows you to explore your filesystem and to open files and
"   directories.
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
"Plugin 'tsaleh/vim-align'
Plugin 'majutsushi/tagbar'
"Plugin 'humiaozuzu/TabBar'
Plugin 'godlygeek/tabular'

"-------------
" Other Utils
" ------------
Plugin 'Lokaltog/vim-powerline'
"Plugin 'powerline/powerline'
Plugin 'vim-scripts/mru.vim'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'vim-scripts/bufexplorer.zip'
"Plugin 'fholgado/minibufexpl.vim'
Plugin 'vim-scripts/greplace.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'sjl/gundo.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'panozzaj/vim-autocorrect'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'myusuf3/numbers.vim'
Plugin 'christoomey/vim-run-interactive'
"Plugin 'ivanov/vim-ipython'
Plugin 'tpope/vim-fugitive'
"Plugin 'vim-scripts/TabLineSet.vim'
"Plugin 'nvie/vim-togglemouse'
"Plugin 'humiaozuzu/fcitx-status'
Plugin 'danro/rename.vim'
Plugin 'pbrisbin/vim-mkdir'

"----------------------------------------
" Syntax/Indent for language enhancement
"----------------------------------------
Plugin 'rweald/pig.vim'
Plugin 'vim-scripts/SAS-Syntax'
Plugin 'davidhalter/jedi-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'derekwyatt/vim-scala'
"Plugin 'klen/python-mode'
"Plugin 'vim-scripts/Vim-R-plugin'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'tpope/vim-markdown'
"Plugin 'nono/jquery.vim'
"Plugin 'pangloss/vim-javascript'
"Plugin '2072/PHP-Indenting-for-VIm'
"Plugin 'tpope/vim-haml'
"Plugin 'othree/html5.vim'
"Plugin 'beyondwords/vim-jinja2'
Plugin 'mattn/emmet-vim'

"--------------
" Color Scheme
"--------------
Plugin 'rickharris/vim-blackboard'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rickharris/vim-monokai'
Plugin 'tpope/vim-vividchalk'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'nanotech/jellybeans.vim'
Plugin 'gilesbowkett/ir_black'
Plugin 'croaky/vim-colors-github'
Plugin 'tomasr/molokai'

"--------------
" Misc
"--------------
"Plugin 'MarcWeber/vim-addon-mw-utils'


"--------------
" Musicx Liu's Forks
"--------------
Plugin 'musicx/teradata'
Plugin 'musicx/LargeFile'
Plugin 'musicx/conque'


"vim-scripts repos
Plugin 'Python-Syntax'
"Plugin 'Smyck-Color-Scheme'
"Plugin 'daylerees'
"Plugin 'tomorrow-theme'
"Plugin 'Comments'

"non github repos
"Plugin 'git://git.wincent.com/command-t.git'

filetype plugin indent on 

" Brief help
" :PluginList            - list configured bundles
" :PluginInstall(!)      - install(update) bundles
" :PluginSearch(!) foo   - search(or refresh cache first) for foo
" :PluginClean(!)        - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed

