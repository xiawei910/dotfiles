set nocompatible
filetype off


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'



"-------------------------------------------------------------
" => Code Completion {{{1
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

""}}}1



"-------------------------------------------------------------
" => Surrounding Operation {{{1
"-------------------------------------------------------------

"   This plug-in provides automatic closing of quotes, parenthesis, brackets, etc.
Plugin 'Raimondi/delimitMate'


"   Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML
"   tags, and more. The plugin provides mappings to easily delete, change and
"   add such surroundings in pairs.
Plugin 'tpope/vim-surround'

""}}}1



"-------------------------------------------------------------
" => Code Reading {{{1
"-------------------------------------------------------------

"   The NERD tree allows you to explore your filesystem and to open files and
"   directories.
Plugin 'scrooloose/nerdtree'


"   Comment functions so powerful—no comment necessary.
Plugin 'scrooloose/nerdcommenter'


"   Run your favorite search tool from Vim, with an enhanced results list.
"   This plugin was designed as a Vim frontend for the Perl module App::Ack. Ack
"   can be used as a replacement for 99% of the uses of grep. The plugin allows
"   you to run ack from Vim, and shows the results in a split window.
"Plugin 'mileszs/ack.vim'


"   Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
"Plugin 'ctrlvim/ctrlp.vim'


"   EasyMotion provides a much simpler way to use some motions in vim. It takes
"   the <number> out of <number>w or <number>f{char} by highlighting all
"   possible choices and allowing you to press one key to jump directly to the
"   target.
"   When one of the available motions is triggered, all visible text preceding
"   or following the cursor is faded, and motion targets are highlighted.
Plugin 'easymotion/vim-easymotion'


"   Tagbar is a Vim plugin that provides an easy way to browse the tags of the
"   current file and get an overview of its structure. It does this by creating
"   a sidebar that displays the ctags-generated tags of the current file,
"   ordered by their scope. This means that for example methods in C++ are
"   displayed under the class they are defined in.
"   Dependencies:
"       Vim 7.0 (But see note below)
"       Exuberant ctags 5.5
Plugin 'majutsushi/tagbar'


"   The plugin is derived from miniBufExplorer. 
"   Only the modifiable buffer are displayed, and counted. 
"   Key-bindings for buffer switching: <Alt-bufNumber> 
"   Colored the tabs with the same color as StatusLineNC to create the 
"   impression of tabs.
"Plugin 'humiaozuzu/TabBar'


"   This plugin aims to make the easy things easy and the hard things possible,
"   without providing an unnecessarily obtuse interface. It's still a work in
"   progress, and criticisms are welcome.
"   Example:
"    abc,def,ghi
"    a,b
"    a,b,c
" 
"   :Tabularize /,/r1c1l0
"
"    abc , def, ghi
"      a , b
"      a , b  ,  c
Plugin 'godlygeek/tabular'

""}}}1



"-------------------------------------------------------------
" => Other Utils {{{1
"-------------------------------------------------------------

"   Powerline is a utility plugin which allows you to create better-looking,
"   more functional vim statuslines.
Plugin 'Lokaltog/vim-powerline'


"   The Most Recently Used (MRU) plugin provides an easy access to a list of
"   recently opened/edited files in Vim.
Plugin 'vim-scripts/mru.vim'


"   The YankRing plugin allows the user to configure the number of yanked,
"   deleted and changed text.  A split window can be used to choose which
"   element(s) from the yankring you wish to paste.  Alternately after text has
"   been pasted (using p), it can be replaced with a previous value from the
"   yankring with a single key stroke.
Plugin 'vim-scripts/YankRing.vim'


"   With bufexplorer, you can quickly and easily switch between buffers
"Plugin 'vim-scripts/bufexplorer.zip'

"   Several modern GUI editors list your open buffers as tabs along the top or
"   bottom of your screen (VisualStudio, DreamWeaver, EditPlus and UltraEdit
"   come to mind), now we have this feature in VIM!
"Plugin 'fholgado/minibufexpl.vim'


"   The Global Replace plugin allows you to search and replace a pattern
"   across multiple files. The lines containing a specified pattern in multiple
"   files are displayed in a buffer. You can edit the lines in this buffer and 
"   make the desired modifications to them. The plugin can then 
"   incorporate these changes back into the corresponding files interactively.
"   Refer to the greplace.txt help file for more information (available with the
"   plugin).
Plugin 'vim-scripts/greplace.vim'


"   Syntastic is a syntax checking plugin for Vim created by Martin Grenfell. It
"   runs files through external syntax checkers and displays any resulting
"   errors to the user. This can be done on demand, or automatically as files
"   are saved. If syntax errors are detected, the user is notified and is happy
"   because they didn't have to compile their code or execute their script to
"   find them.
Plugin 'vim-syntastic/syntastic'

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

"}}}1



"-------------------------------------------------------------
" Syntax/Indent for language enhancement
"-------------------------------------------------------------
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



"-------------------------------------------------------------
" Color Scheme
"-------------------------------------------------------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'acarapetis/vim-colors-github'
Plugin 'tomasr/molokai'
"Plugin 'rickharris/vim-blackboard'
"Plugin 'rickharris/vim-monokai'
"Plugin 'tpope/vim-vividchalk'
"Plugin 'Lokaltog/vim-distinguished'



"-------------------------------------------------------------
" Misc
"-------------------------------------------------------------
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tsaleh/vim-align'



"-------------------------------------------------------------
" Musicx Liu's Forks
"-------------------------------------------------------------
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


"   All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required






" Brief help
" :PluginList            - list configured bundles
" :PluginInstall(!)      - install(update) bundles
" :PluginSearch(!) foo   - search(or refresh cache first) for foo
" :PluginClean(!)        - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed
