
let s:vim_cache = expand('$HOME/.vim_tmp')
let g:plugin_home = expand('$HOME/.vim/bundle/')



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neocomplcache settings {{{1
" => shared with neocomplete.vim, which require lua
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplcache.
""let g:neocomplcache_enable_at_startup = 1
"let g:neocomplete#enable_at_startup = 1
"" Use smartcase.
""let g:neocomplcache_enable_smart_case = 1
"let g:neocomplete#enable_smart_case = 1
"" Use camel case completion.
""let g:neocomplcache_enable_camel_case_completion = 1
"" Use underbar completion.
""let g:neocomplcache_enable_underbar_completion = 1
"" Set minimum syntax keyword length.
""let g:neocomplcache_min_syntax_length = 3
""let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"let g:neocomplete#min_syntax_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'


"" Define dictionary.
""let g:neocomplcache_dictionary_filetype_lists = {
""            \ 'default' : '',
""            \ 'vimshell' : $HOME.'/.vimshell_hist',
""            \ 'scheme' : $HOME.'/.gosh_completions'
""            \ }
"let g:neocomplete#sources#dictionary#dictionaries = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"    \ }

"" Define keyword.
""if !exists('g:neocomplcache_keyword_patterns')
"    "let g:neocomplcache_keyword_patterns = {}
""endif
""let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"if !exists('g:neocomplete#keyword_patterns')
"    let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'


"" Plugin key-mappings.
""imap <C-k>     <Plug>(neocomplcache_snippets_expand)
""smap <C-k>     <Plug>(neocomplcache_snippets_expand)
""inoremap <expr><C-g>     neocomplcache#undo_completion()
""inoremap <expr><C-l>     neocomplcache#complete_common_string()
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()

"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"    "return neocomplcache#smart_close_popup() . "\<CR>"
"    return neocomplete#close_popup() . "\<CR>"
"    " For no inserting <CR> key.
"    "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
"    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
"" <TAB>: completion.
""inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
""inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
""inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
""inoremap <expr><C-y>  neocomplcache#close_popup()
""inoremap <expr><C-e>  neocomplcache#cancel_popup()
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplete#close_popup()
"inoremap <expr><C-e>  neocomplete#cancel_popup()
"
"inoremap <expr><C-d>  pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
"inoremap <expr><C-u>  pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

"" AutoComplPop like behavior.
""let g:neocomplcache_enable_auto_select = 1
""let g:neocomplete#enable_auto_select = 1

"" Enable heavy omni completion.
""if !exists('g:neocomplcache_omni_patterns')
"    "let g:neocomplcache_omni_patterns = {}
""endif
"if !exists('g:neocomplete#sources#omni#input_patterns')
"    let g:neocomplete#sources#omni#input_patterns = {}
"endif

""let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
""let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
""let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
""let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neocomplete settings {{{1
" => require lua
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if isdirectory(expand(g:plugin_home . 'neocomplete'))

    "Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

endif

" }}}1

        

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neosnippet settings {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if isdirectory(expand(g:plugin_home . 'neosnippet'))
    " Plugin key-mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)
    "xmap <C-l>     <Plug>(neosnippet_start_unite_snippet_target)

    " SuperTab like snippets behavior.
    imap <expr><TAB> neosnippet#expandable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: "\<TAB>"

    " For snippet_complete marker.
    if has('conceal')
        "set conceallevel=2 concealcursor=i
        set conceallevel=2 concealcursor=niv
    endif

    " Enable snipMate compatibility feature.
    " let g:neosnippet#enable_snipmate_compatibility = 1

    " Tell Neosnippet about the other snippets
    let g:neosnippet#snippets_directory=g:plugin_home . '/vim-snippets/snippets'

endif

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>) {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
"snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => delimitMate settings {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if isdirectory(expand(g:plugin_home . 'delimitMate'))

    " Enable <cr> within quotes
    let g:delimitMate_expand_cr = 1
    let g:delimitMate_expand_space = 1
    let g:delimitMate_matchpairs = "(:),[:],{:}"
    autocmd FileType html,xml let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

endif

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-surround config {{{1
" Annotate strings with gettext http://amix.dk/blog/post/19678
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if isdirectory(expand(g:plugin_home . 'vim-surround'))

    vmap Si S(i_<esc>f)
    au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

endif

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdtree {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if isdirectory(expand(g:plugin_home . 'nerdtree'))

    map <leader>nn :NERDTreeToggle<cr>
    map <leader>nb :NERDTreeFromBookmark
    map <leader>nf :NERDTreeFind<cr>
    map <leader>nc :NERDTree<space><C-r>=expand('%:p:h')<cr><cr>
    cno <expr> $nt getcmdtype() = ':' ? NERDTree : '$nt'
    let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.swp$', '\.swo$', '\.git', '\.hg', '\.svn', '\.bzr']
    "let NERDTreeShowHidden = 1
    let NERDTreeShowBookmarks = 1

endif

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdcommenter {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if isdirectory(expand(g:plugin_home . 'nerdcommenter'))

    "   The following key mappings are provided by default:
    "
    "[count]<leader>cc |NERDComComment|
    "   Comment out the current line or text selected in visual mode.
    "
    "[count]<leader>c<space> |NERDComToggleComment|
    "   Toggles the comment state of the selected line(s). If the topmost
    "   selected line is commented, all selected lines are uncommented and vice
    "   versa.

    " ,/ to invert comment on ther current line/selection
    nnoremap <leader>/ :call NERDComment(0, "invert")<cr>

    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 0
    
    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1
    
    " Align line-wise comment delimiters flush left instead of following code indentation
    let g:NERDDefaultAlign = 'left'
    
    " Set a language to use its alternate delimiters by default
    let g:NERDAltDelims_java = 1
    
    " Add your own custom formats or override the defaults
    "let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
    
    " Allow commenting and inverting empty lines (useful when commenting a region)
    "let g:NERDCommentEmptyLines = 1
    
    " Enable trimming of trailing whitespace when uncommenting
    "let g:NERDTrimTrailingWhitespace = 1

endif

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CTRL-P {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if isdirectory(expand(g:plugin_home . 'ctrlp.vim'))

    " allow the ctrlp to start at the folder of current file unless cwd is ancester of current file
    let g:ctrlp_working_path_mode = 'a'

    " directory for cache files
    let g:ctrlp_cache_dir = s:vim_cache . '/ctrlp_cache'

    "let g:ctrlp_map = '<C-f>'
    "map <C-b> :CtrlPBuffer<cr>
    map <leader>fh :CtrlP<space>~<cr>
    map <leader>fc :CtrlP<space><C-r>=expand('%:p:h')<cr>

    let g:ctrlp_max_height = 20
    "let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
    let g:ctrlp_custom_ignore = {
        \ 'dir' : '\.git$\|\.hg$\|\.svn$' ,
        \ 'file' : '\.exe$\|\.so$\|\.dll$\|^\.DS_Store\|^\.git\|^\.coffee' }

    if executable('ag')
        " Use Ag over Grep
        set grepprg=ag\ --nogroup\ --nocolor
        " Use ag in CtrlP for listing files.
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
        " Ag is fast enough that CtrlP doesn't need to cache
        let g:ctrlp_use_caching = 0
    endif

    "let g:ctrlp_user_command = 'find %s -type f'       " MacOSX/Linux
    "let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d' " Windows

endif

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if isdirectory(expand(g:plugin_home . 'tagbar'))

    nmap <Leader>ba :TagbarToggle<CR>
    let g:tagbar_type_go = {
        \ 'ctagstype': 'go',
        \ 'kinds' : [
            \'p:package',
            \'f:function',
            \'v:variables',
            \'t:type',
            \'c:const'
        \ ]
    \ }
    let g:tagbar_type_scala = {
        \ 'ctagstype' : 'scala',
        \ 'sro'       : '.',
        \ 'kinds'     : [
        \ 'p:packages',
        \ 'T:types:1',
        \ 't:traits',
        \ 'o:objects',
        \ 'O:case objects',
        \ 'c:classes',
        \ 'C:case classes',
        \ 'm:methods',
        \ 'V:values:1',
        \ 'v:variables:1'
        \ ]
    \ }

endif

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Powerline {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if isdirectory(expand(g:plugin_home . 'powerline'))

    let g:Powerline_symbols = 'fancy'

endif

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MRU plugin {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if isdirectory(expand(g:plugin_home . 'mru.vim'))

    let MRU_Max_Entries = 400
    let MRU_File = s:vim_cache . '/_vim_mru_files'
    map <leader>u :MRU<CR>

endif

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YankRing {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if isdirectory(expand(g:plugin_home . 'YankRing.vim'))

    let g:yankring_history_dir = s:vim_cache

    " ,y to show the yankring
    nmap <leader>y :YRShow<cr>

    " recommended replacing yk replace keys
    let g:yankring_replace_n_pkey = '[k'
    let g:yankring_replace_n_nkey = ']k'

endif

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => bufExplorer plugin {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if 0 && isdirectory(expand(g:plugin_home . 'bufexplorer.zip'))

    let g:bufExplorerDefaultHelp=0
    let g:bufExplorerShowRelativePath=1
    let g:bufExplorerFindActive=1
    let g:bufExplorerSortBy='name'
    nmap <leader>bb :BufExplorer<cr>
    nmap <leader>bs :BufExplorerHorizontalSplit<cr>
    nmap <leader>bv :BufExplorerVerticalSplit<cr>

endif

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => syntastic settings {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if isdirectory(expand(g:plugin_home . 'syntastic'))

    " Set the syntastic checking to passive mode
    let g:syntastic_mode_map = { "mode" : "passive",
                            \  "active_filetypes" : [],
                            \  "passive_filetypes" : [] }

    " Set the statusline format for syntastic part
    let g:syntastic_stl_format = '[%E{E:%e#%fe}%B{+}%W{W:%w#%fw}]'

    " Set the default python syntax checker
    let g:syntastic_python_checker_args = 'pyflakes'

    " configure syntastic syntax checking to check on open as well as save
    let g:syntastic_check_on_open = 1
    let g:syntastic_html_tidy_ignore_errors = [" proprietary attribute \"ng-"]
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_wq = 0

endif

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Conque settings {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To leave the 'input mode', if <esc> is set, then the real <esc> needs double click
"let g:ConqueTerm_EscKey = '<ESC>'

" Toggle Conque Terminal mode
let g:ConqueTerm_ToggleKey = '<F8>'

" Execute current file in Conque, equal to :ConqueTermSplit 'CurrentFile'
let g:ConqueTerm_ExecFileKey = '<nop>'

" Send all content in current file to most recently opened Conque as input
let g:ConqueTerm_SendFileKey = '<nop>'

" Send the selected text to most recently opened Conque as input
let g:ConqueTerm_SendVisKey = '<F9>'

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Conque shortcut settings {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap <silent> <localleader>qs :ConqueTerm /sasadmin/sas92home/SASFoundation/9.2/sas -nodms<cr><esc>:set ft=sas<cr>i
"nmap <silent> <localleader>qb :ConqueTerm bteq<cr>.set width 3000<cr>.logon<esc>:set ft=teradata<cr>i
nmap <silent> <localleader>qp :ConqueTerm ipython<cr>
if has("win16") || has("win32") || has("win64")
    nmap <silent> <localleader>qt :ConqueTerm powershell.exe<cr>
else
    nmap <silent> <localleader>qt :ConqueTerm bash<cr>
endif

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim grep {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated .git'
set grepprg=/bin/grep\ -nH

" }}}1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gundo {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>gu :GundoToggle<cr>

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => omnicomplete settings {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" ctrl+space for omnicompletion
inoremap <C-Space> <C-X><C-O>

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python-mode settings {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable if python support not present
if !has('python')
    let g:pymode = 1
endif
let g:pymode = 1

" Key for show python documentation
let g:pymode_doc_key = '<leader>k'

" Key for run python code
"let g:pymode_run_key = '<leader>r'

" Key for set/unset breakpoint
let g:pymode_breakpoint_key = '<leader>s'

" Don't needed options
let g:pymode_options = 0

" For fast machines
let g:pymode_syntax_slow_sync = 0

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pylint configuration file {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable pylint checking every save
let g:pymode_lint_write = 0

" Switch pylint, pyflakes, pep8, mccabe code-checkers
" Can have multiply values "pep8,pyflakes,mcccabe"
"let g:pymode_lint_checker = "pyflakes,pep8,mccabe"

" Run linter on the fly
"let g:pymode_lint_onfly = 0

" Minimal height of pylint error window
let g:pymode_lint_minheight = 5

" Maximal height of pylint error window
let g:pymode_lint_maxheight = 10

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rope refactoring library {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load rope plugin
"let g:pymode_rope = 1

" Auto create and open ropeproject
let g:pymode_rope_auto_project = 1

" Enable autoimport
let g:pymode_rope_enable_autoimport = 1
let g:pymode_rope_autoimport_modules = ["os","shutil","datetime"]

" Auto generate global cache
let g:pymode_rope_autoimport_generate = 1

" The maximum number of syntax errors to fix for code assists
let g:pymode_rope_codeassist_maxfixes = 10

let g:pymode_rope_sorted_completions = 1

let g:pymode_rope_extended_complete = 1

let g:pymode_rope_confirm_saving = 1

let g:pymode_rope_global_prefix = "<localleader>g"

let g:pymode_rope_local_prefix = "<localleader>r"

let g:pymode_rope_vim_completion = 1

let g:pymode_rope_guess_project = 1

" open a vertial split to show the "go to definition" result
let g:pymode_rope_goto_def_newwin = "vnew"

let g:pymode_rope_always_show_complete_menu = 0

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-ipython settings {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable default mappings
let g:ipy_perform_mappings = 0

" Vim-IPython will block other completefunc plugins globally
" using 'local' or anything other than 'global' to change to
" local buffer or disable it.
let g:ipy_completefunc = 'null'

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Jedi-vim settings {{{1
" This one should not be used with pymode_rope simultaneously
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goto command is default <leader>g
let g:jedi#goto_assignments_command = "<localleader>g"

" Get_definition command is default <leader>d
let g:jedi#goto_definitions_command = "<localleader>d"

" Show pydoc is default <S-K>
let g:jedi#documentation_command = "<leader>k"

" Use tabs or buffers, default tabs
let g:jedi#use_tabs_not_buffers = 0

" Popout on dot and goto the first one? default 1
let g:jedi#popup_on_dot = 0

" Refactoring command
let g:jedi#rename_command = "<localleader>r"

" Related names with the same origin list command
let g:jedi#usages_command = "<localleader>n"

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => auto correction settings {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd filetype markdown,mkd call AutoCorrect()

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim indent guides {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => wildfire {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" this selects the next closest text object
map <Leader>fo <Plug>(wildfire-fuel)
" this selects the previous closest text object
map <Leader>fi <Plug>(wildfire-water)

nmap <Leader>fs <Plug>(wildfire-quick-select)

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim multiple cursor {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<ESC>'
let g:multi_cursor_exit_from_visual_mode = 1
let g:multi_cursor_exit_from_insert_mode = 1

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => numbers settings {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:enable_numbers = 0
nnoremap <Leader>re :NumbersOnOff<CR>
nnoremap <Leader>rn :NumbersToggle<CR>

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => rainbow parentheses settings {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:rbpt_colorpairs = [
"    \ ['black',       'SeaGreen3'],
"    \ ['darkgray',    'DarkOrchid3'],
"    \ ['darkgreen',   'firebrick3'],
"    \ ['darkcyan',    'RoyalBlue3'],
"    \ ['Darkblue',    'SeaGreen3'],
"    \ ['darkred',     'SeaGreen3'],
"    \ ['brown',       'firebrick3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['gray',        'RoyalBlue3'],
"    \ ['Darkblue',    'firebrick3'],
"    \ ['red',         'firebrick3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['darkgreen',   'RoyalBlue3'],
"    \ ['brown',       'RoyalBlue3'],
"    \ ['darkcyan',    'SeaGreen3'],
"    \ ['darkred',     'DarkOrchid3'],
"    \ ]

"autocmd VimEnter * RainbowParenthesesToggle
"autocmd Syntax * RainbowParenthesesLoadRound
"autocmd Syntax * RainbowParenthesesLoadSquare
"autocmd Syntax * RainbowParenthesesLoadBraces

" }}}1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => emmet {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

let g:user_emmet_leader_key = '<C-Z>'

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => run interactive command {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>ri :RunInInteractiveShell<space>

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim git gutter {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" }}}1



