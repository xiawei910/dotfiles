

"""""""""""""""""""""""""""""""""""""""""""'"""""""""""""""""""
" => Python section {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Python syntax settings
let g:python_highlight_all = 1
let g:python_slow_sync = 1

" Python folding
au FileType python setlocal foldmethod=expr
au FileType python setlocal foldexpr=PythonFoldingExpr(v:lnum)
au FileType python setlocal foldtext=PythonFoldingText()

" Python motion
au FileType python call PythonMotionMap()

" Python insert mode shortcuts
au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
"au FileType python map <buffer> <leader>1 /class
"au FileType python map <buffer> <leader>2 /def
"au FileType python map <buffer> <leader>C ?class
"au FileType python map <buffer> <leader>D ?def

" Python PEP8 says tabstop=8
au FileType python setlocal tabstop=4

"au BufNewFile,BufRead *.jinja set syntax=htmljinja
"au BufNewFile,BufRead *.mako set ft=mako


"""""""""""""""""""""""""""""""""""""""""""""""""
" Pymode functions renamed: pymode => python
"""""""""""""""""""""""""""""""""""""""""""""""""
let s:blank_regex = '^\s*$'
let s:def_regex = '^\s*\(class\|def\) \w\+'

fun! PythonFoldingText()
    let fs = v:foldstart
    while getline(fs) =~ '^\s*@' 
        let fs = nextnonblank(fs + 1)
    endwhile
    let line = getline(fs)
    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart
    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')
    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction

fun! PythonFoldingExpr(lnum)
    let line = getline(a:lnum)
    let indent = indent(a:lnum)
    if line =~ s:def_regex
        return ">".(indent / &shiftwidth + 1)
    endif
    if line =~ '^\s*@'
        return -1
    endif
    if line =~ s:blank_regex
        let prev_line = getline(a:lnum - 1)
        if prev_line =~ s:blank_regex
            return -1
        else
            return foldlevel(prevnonblank(a:lnum))
        endif
    endif
    if indent == 0
        return 0
    endif
    return '='
endfunction 

fun! PythonMotionMap()
    nnoremap <buffer> ]]  :<C-U>call MotionMove('^\s*\(class\\|def\)\s', '')<CR>
    nnoremap <buffer> [[  :<C-U>call MotionMove('^\s*\(class\\|def\)\s', 'b')<CR>
    nnoremap <buffer> ]m  :<C-U>call MotionMove('^\s*def\s', '')<CR>
    nnoremap <buffer> [m  :<C-U>call MotionMove('^\s*def\s', 'b')<CR>

    onoremap <buffer> ]]  :<C-U>call MotionMove('^\s*\(class\\|def\)\s', '')<CR>
    onoremap <buffer> [[  :<C-U>call MotionMove('^\s*\(class\\|def\)\s', 'b')<CR>
    onoremap <buffer> ]m  :<C-U>call MotionMove('^\s*def\s', '')<CR>
    onoremap <buffer> [m  :<C-U>call MotionMove('^\s*def\s', 'b')<CR>

    vnoremap <buffer> ]]  :call MotionVmove('^\s*\(class\\|def\)\s', '')<CR>
    vnoremap <buffer> [[  :call MotionVmove('^\s*\(class\\|def\)\s', 'b')<CR>
    vnoremap <buffer> ]m  :call MotionVmove('^\s*def\s', '')<CR>
    vnoremap <buffer> [m  :call MotionVmove('^\s*def\s', 'b')<CR>
endfunction

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => JavaScript section {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <C-t> AJS.log();<esc>hi
au FileType javascript imap <C-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

" }}}1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SQL section {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" FileType related
au BufNewFile,BufRead *.sql,*.btq set filetype=teradata

" }}}1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MarkDown section {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" FileType related
au BufNewFile,BufRead *.md set filetype=markdown

" }}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Functions for moving
function! MotionMove(pattern, flags, ...)
    let cnt = v:count1 - 1
    let [line, column] = searchpos(a:pattern, a:flags . 'sW')
    let indent = indent(line)
    while cnt && line
        let [line, column] = searchpos(a:pattern, a:flags . 'W')
        if indent(line) == indent
            let cnt = cnt - 1
        endif
    endwhile
    return [line, column]
endfunction

function! MotionVmove(pattern, flags) range
    call cursor(a:lastline, 0)
    let end = MotionMove(a:pattern, a:flags)
    call cursor(a:firstline, 0)
    normal! v
    call cursor(end)
endfunction

" }}}1

