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

"   Using the jedi autocompletion library for VIM.
Plugin 'davidhalter/jedi-vim'

"   Conque is a Vim plugin which allows you to run interactive programs, such as
"   bash on linux or powershell.exe on Windows, inside a Vim buffer. In other
"   words it is a terminal emulator which uses a Vim buffer to display the
"   program output. 
Plugin 'musicx/conque'

"   Command-T is a Vim plug-in that provides an extremely fast "fuzzy" mechanism
"   for:
"       Opening files and buffers
"       Jumping to tags and help
"       Running commands, or previous searches and commands
"   with a minimal number of keystrokes.
"Plugin 'wincent/command-t'

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

"   A tool to set up iabbrev.
"Plugin 'tpope/vim-abolish'

"   Correct common typos and misspellings as you type in Vim
Plugin 'panozzaj/vim-autocorrect'

"   pairs of handy bracket mappings
"Plugin 'tpope/vim-unimpaired'

"   If you've ever tried using the "." command after a plugin map, you were
"   likely disappointed to discover it only repeated the last native command
"   inside that map, rather than the map as a whole.  That disappointment ends
"   today.  Repeat.vim remaps "." in a way that plugins can tap into it. 
"Plugin 'tpope/vim-repeat'

"   use CTRL-A/CTRL-X to increment dates, times, and more
Plugin 'tpope/vim-speeddating'

"   Gundo.vim is Vim plugin to visualize your Vim undo tree.
"   Gundo requires Vim to be compiled with Python 2.4+
Plugin 'sjl/gundo.vim'

"   
"   This Vim plugin will search for terms using the excellent Dash.app , making
"   API lookups simple.
Plugin 'rizzatti/dash.vim'

"   Better Rainbow Parentheses
Plugin 'kien/rainbow_parentheses.vim'

"   numbers.vim is a plugin for intelligently toggling line numbers.
"   This plugin alternates between relative numbering (relativenumber) and
"   absolute numbering (number) for the active window depending on the mode you
"   are in. In a GUI, it also functions based on whether or not the app has
"   focus.
"Plugin 'myusuf3/numbers.vim'

"   Run Interactive is a Vim plugin for selectively running commands via an
"   interactive shell. This allows you to take advantage of custom functions,
"   aliases, etc that are configured via your login shell scripts.
Plugin 'christoomey/vim-run-interactive'

"   A two-way integration between Vim and IPython 0.11+ 
"Plugin 'ivanov/vim-ipython'

"   a Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-fugitive'

"   Rename the current file in the vim buffer + retain relative path.
Plugin 'danro/rename.vim'

"   Automatically create any non-existent directories before writing the buffer.
Plugin 'pbrisbin/vim-mkdir'

"   Editing large files can be a time consuming process as Vim is working on a
"   number of things behind the scenes, such as maintaining an undo database,
"   searching for a syntax highlighting synchronization point, etc.
"   LargeFile.vim is a very small "plugin"; mostly, its just an autocmd that
"   disables certain features of vim in the interests of speed.
Plugin 'vim-scripts/LargeFile'

"}}}1



"-------------------------------------------------------------
" Syntax/Indent for language enhancement {{{1
"-------------------------------------------------------------

"   Enhanced version of the original Python syntax highlighting script.
Plugin 'hdima/python-syntax'

"   Pig syntax highlighting for vim
Plugin 'motus/pig.vim'

"   Syntax Script for SAS 9.1/9.2/9.3
Plugin 'vim-scripts/SAS-Syntax'

"   Syntax highlighting, matching rules and mappings for the original Markdown
"   and extensions.
Plugin 'plasticboy/vim-markdown'

"   This is a "bundle" for Vim that builds off of the initial Scala plugin
"   modules by Stefan Matthias Aust and adds some more "stuff" that I find
"   useful, including all of my notes and customizations.
Plugin 'derekwyatt/vim-scala'

"   emmet-vim is a vim plug-in which provides support for expanding
"   abbreviations similar to emmet.
"   Emmet is a plugin for many popular text editors which greatly improves HTML
"   & CSS.
Plugin 'mattn/emmet-vim'

"Plugin 'klen/python-mode'
"Plugin 'vim-scripts/Vim-R-plugin'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'nono/jquery.vim'
"Plugin 'pangloss/vim-javascript'
"Plugin '2072/PHP-Indenting-for-VIm'
"Plugin 'tpope/vim-haml'
"Plugin 'othree/html5.vim'
"Plugin 'beyondwords/vim-jinja2'
"Plugin 'musicx/teradata'

"}}}1



"-------------------------------------------------------------
" Color Scheme {{{1
"-------------------------------------------------------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'acarapetis/vim-colors-github'
Plugin 'tomasr/molokai'
"Plugin 'chriskempson/tomorrow-theme'
"Plugin 'rickharris/vim-blackboard'
"Plugin 'rickharris/vim-monokai'
"Plugin 'tpope/vim-vividchalk'
"Plugin 'Lokaltog/vim-distinguished'
"Plugin 'hukl/Smyck-Color-Scheme'

"}}}1



"-------------------------------------------------------------
" Misc {{{1
"-------------------------------------------------------------
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tsaleh/vim-align'
"Plugin 'vim-scripts/TabLineSet.vim'
"Plugin 'nvie/vim-togglemouse'
"Plugin 'humiaozuzu/fcitx-status'

"}}}1



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
