"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" For when you forget to sudo
cmap w!! w !sudo tee % > /dev/null

" Storage settings
let s:vim_cache = expand('$HOME/.vim_tmp')
if filewritable(s:vim_cache) == 0 && exists("*mkdir")
    call mkdir(s:vim_cache, "p", 0700)
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 5 lines to the cursor - when moving vertically using j/k
set scrolloff=5

" Ignore compiled files
set wildignore+=*.o,*.pyc,*.exe,*.swp,*.obj
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
if has("win16") || has("win32") || has("win64")
    set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*
endif

" Ignored suffixes
set suffixes+=.class,.exe,.o,.obj,.dll,.aux

" Turn on the WiLd menu
set wildmenu

" command <Tab> completion, list matches, then longest common part, then all
set wildmode=list:longest,full

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2

" No annoying sound on errors
set noerrorbells
set visualbell t_vb=

" Time allowed for a seris of key strokes
set timeoutlen=600

" Add a bit extra margin to the left
set foldcolumn=1

" highlight current line
set cursorline

" toggle of line numbers
set number
set numberwidth=3
map <leader>ln :setlocal number!<cr>

" windows can be 0 line high
set winminheight=0

" abbrev. of messages (avoids 'hit enter')
set shortmess+=filmnrxoOtT

" better unix / windows compatibility
set viewoptions=folds,options,cursor,unix,slash

" allow for cursor beyond last character
set virtualedit=onemore

" highlight problematic whitespaces
set nolist
map <leader>li :setlocal list!<cr>
set listchars=tab:>-,trail:.,extends:>,nbsp:.
autocmd FileType c,cpp,java,php,javascript,python,xml,html,teradata,sas setlocal list

" No double spaces when joining lines after ".", "?", "!"
set nojoinspaces

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,bg18030,gbk,big5

" fast change fileencode and fileformat to unix/utf8
nmap <leader>8 :set ff=unix fenc=utf-8<cr>

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Add some common encodings to be readable
set fencs=ucs-bom,utf-8,default,cp936,gb18030,utf-16,utf-16le,big5,euc-jp,euc-kr,latin1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    "set t_Co=256
    set guitablabel=%M\ %t
endif

" Set color related stuffs
let g:solarized_termcolors=256
set t_Co=256

try
    colorscheme jellybeans
catch
    colorscheme desert
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backup
set writebackup
set noswapfile

"function to set if backup is needed
function! InitBackupSetting()
    if line("$") > 4000
        setlocal nobackup
        setlocal nowritebackup
    endif
endfunction

"function to initialize the backup folders
function! InitBackupDir()
    if &backup == 0
        return
    endif
    let l:inc_root_backup_dir = s:vim_cache . "/backup"
    let l:inc_cur_dir = substitute(substitute(expand('%:p:h'),"\[ .\]","_","g"),":","","")
    let l:inc_backup_dir = l:inc_root_backup_dir . '/' . l:inc_cur_dir
    "make DRIVE directory if it doesn't exist
    if !filewritable(l:inc_backup_dir) && exists("*mkdir")
        "silent execute expand('!mkdir ' . l:inc_backup_dir)
        call mkdir(l:inc_backup_dir, "p", 0700)
    endif
    "set new backup dir
    execute expand('set backupdir=' . l:inc_backup_dir)
    "echo l:inc_backup_dir
endfunction

"set backupdir=$HOME/.vim_tmp/backup
autocmd BufReadPost * call InitBackupSetting()
autocmd BufWritePre * call InitBackupDir()
autocmd BufWritePre * let &bex = '-' . strftime("%y%m%d-%H%M")

function! InitializeDirectories()
    let separator = "."
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undodir'] = 'undodir'
    endif

    for [dirname, settingname] in items(dir_list)
        let directory = s:vim_cache . "/" . dirname . "/"
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory, "p", 0700)
            endif
        endif
        if !isdirectory(directory)
            "echo "Warning: Unable to create backup directory: " . directory
            "echo "Try: mkdir -p " . directory
            silent execute expand('!mkdir -p ' . directory)
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
"call InitializeDirectories()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" round indent to multiple of shiftwidth
set shiftround

" let backspace delete indent
set softtabstop=4

" Linebreak on 500 characters
"set linebreak
set textwidth=100

" Intent settings
set autoindent
set smartindent
set wrap "Wrap lines
map <leader>wr :setlocal wrap!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
"map j gj
"map k gk
map <Up> gk
map <Down> gj

" keep selection after in/outdent
vnoremap < <gv
vnoremap > >gv

" center display after searching
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Count the number of researching pattern
map <leader>gn :%s///gn<cr>

" Disable highlight when <leader>h is pressed
map <silent> <leader>h :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" change windows size
nmap <C-_> <C-W>_
nmap <M-Up> <C-W>+
nmap <M-Down> <C-W>-
nmap <M-Right> <C-W>>
nmap <M-Left> <C-W><

" Move window position
map <C-Up> <C-W>K
map <C-Down> <C-W>J
map <C-Left> <C-W>H
map <C-Right> <C-W>L

" Control where to put the new split window
"set splitbelow
set splitright
set noequalalways

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>tl :tabnext 

" some more [] motions
map ]w gt
map [w gT
map ]W :tablast<cr>
map [W :tabfirst<cr>

" move the current window into new tab page
nmap <C-T> <C-w>T

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Pos\ %l:%v\ [%p%%]

" statusline setup
set statusline =[%F]

" read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

" modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

" display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

" display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

"set statusline+=%h "help file flag
set statusline+=%y "filetype

" git hotness
set statusline+=%{fugitive#statusline()}

" display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{StatuslineTrailingSpaceWarning()}

set statusline+=%{StatuslineLongLineWarning()}

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%= "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c, "cursor column
set statusline+=%l/%L "cursor line/total lines
set statusline+=\ %P "percent through file


""""""""""""""""""""""""""""""""""""""""""""
" => Statusline Helper functions
""""""""""""""""""""""""""""""""""""""""""""
" recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

" return '[\s]' if trailing white space is detected
" return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

" return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

" recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

" return '[&et]' if &et is set wrong
" return '[mixed-indenting]' if spaces and tabs are used to indent
" return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''
        if !&modifiable
            return b:statusline_tab_warning
        endif
        let tabs = search('^\t', 'nw') != 0
        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0
        if tabs && spaces
            let b:statusline_tab_warning = '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction

" recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

" return a warning for "long lines" where "long" is either &textwidth or 80 (if
" no &textwidth is set)
"
" return '' if no long lines
" return '[#x,my,$z] if long lines are found, were x is the number of long
" lines, y is the median length of the long lines and z is the length of the
" longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")
        if !&modifiable
            let b:statusline_long_line_warning = ''
            return b:statusline_long_line_warning
        endif
        let long_line_lens = s:LongLines()
        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

" return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)
    let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
    return filter(line_lens, 'v:val > threshold')
endfunction

" find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
"map 0 ^
map <Home> ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWritePre *.py :call DeleteTrailingWS()
autocmd BufWritePre *.coffee :call DeleteTrailingWS()
nmap <leader>mm :call DeleteTrailingWS()<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>ms mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press <leader>gg you vimgrep after the selected text
vnoremap <silent> <leader>gg :call VisualSelection('grep', '')<CR>

" When you press <leader>gr you can search and replace the selected text
vnoremap <silent> <leader>gr :call VisualSelection('replace', '')<CR>

" Open vimgrep and put the cursor in the right position
nnoremap <leader>gd :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
nnoremap <leader>gc :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => quickfix and location list window
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you search with vimgrep, display your results in cope by doing:
map <leader>vv :botright cope<cr>

" Copy the whole quickfix window to a new tab
map <leader>vo ggVGy:tabnew<cr>:set syntax=qf<cr>pgg

" Move between location list. Covered by unimpaired [|]q etc
"map <localleader>n :cn<cr>
"map <localleader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,zz will toggle and untoggle spell checking
map <leader>zz :setlocal spell!<cr>

" Shortcuts using <leader>
"map <leader>sn ]s
"map <leader>sp [s
"map <leader>sa zg
"map <leader>s? z=

" fd0's color scheme, the default is really bad
"highlight clear SpellBad
"highlight SpellBad term=standout term=underline cterm=italic ctermfg=Red
"highlight clear SpellCap
"highlight SpellCap term=standout term=underline cterm=italic ctermfg=Blue
"highlight clear SpellLocal
"highlight SpellLocal term=standout term=underline cterm=italic ctermfg=Blue
"highlight clear SpellRare
"highlight SpellRare term=standout term=underline cterm=italic ctermfg=Blue


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" easier increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

"chinese support
"set fileencodings=utf-8,chinese,cp936
"language messages zh_CN.utf-8
if has("gui_running")
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif

" enable matchit
runtime macros/matchit.vim

" Map Space for folding
map <Space> za

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'grep'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

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

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


" This function puts all the filenames in the quickfix window to the args list
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
    let buffer_numbers = {}
    for quickfix_item in getqflist()
        let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
    endfor
    return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction


function! TabLineStyle()
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
        let buflist = tabpagebuflist(i)
        let winnr = tabpagewinnr(i)
        let s .= '%' . i . 'T'
        let s .= (i == t ? '%1*' : '%2*')
        let s .= ' '
        let s .= i . ':'
        let s .= '%*'
        let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
        let file = bufname(buflist[winnr - 1])
        let bufmodified = getbufvar(file, "&mod")
        let file = fnamemodify(file, ':p:t')
        "let file = pathshorten(file)
        if file == ''
            let file = '[No Name]'
        endif
        let s .= file
        if bufmodified
            let s .= ' +'
        endif
        let s .= ' '
        let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TabLine settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showtabline=2
if exists("+showtabline")   
    set tabline=%!TabLineStyle()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    set lines=45 columns=130
endif

" Set font according to system
if has("mac") || has("macunix")
    set gfn=Menlo:h12
    set shell=/bin/zsh
elseif has("win16") || has("win32") || has("win64")
    set gfn=Consolas:h11
elseif has("linux")
    set gfn=Monospace\ 10
    set shell=/bin/bash
endif

" Open MacVim in fullscreen mode
if has("gui_macvim")
    set fuoptions=maxvert,maxhorz
    "au GUIEnter * set fullscreen
endif

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>ee :e! $HOME/.dotfiles/vim_runtime/vimrcs/vimrc.vim<cr>
"autocmd! bufwritepost vimrc source ~/.vim/vimrcs/vimrc.vim
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("persistent_undo")
    set undofile
    let &undodir= s:vim_cache . '/undodir'
    if filewritable(&undodir) == 0 && exists("*mkdir")
        call mkdir(&undodir, "p", 0700)
    endif

    augroup persistent_undo
        au!
        au BufWritePre *.tmp setlocal noundofile
        au BufWritePre *.bak setlocal noundofile
        "au BufWritePre /tmp/* setlocal noundofile
        "au BufWritePre COMMIT_EDITMSG setlocal noundofile
        "au BufWritePre .vim-aside setlocal noundofile
    augroup END
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
"cno %H e ~/
"cno %C e <C-\>eCurrentFileDir("e")<cr>
cno <expr> %% getcmdtype() == ':' ? expand('%:p:h').'/' : '%%'

" $q is super useful when browsing on the command line
" it deletes everything until the last slash
cno <C-Q> <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Map ½ to something useful
map ½ $
cmap ½ $
imap ½ $


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! DeleteTillSlash()
    let g:cmd = getcmdline()

    if has("win16") || has("win32") || has("win64")
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd == g:cmd_edited
        if has("win16") || has("win32") || has("win64")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif

    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Insert mode related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map Alt-Space to underscore
inoremap <A-Space> _
cnoremap <A-Space> _

" Add undo point before Ctrl-U deletes the whole line
inoremap <C-U> <C-G>u<C-U>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Session control
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>ls :call LoadSession()<cr>
" if session is loaded after vim is started, save it when exit
let s:sessionloaded = 0
function LoadSession()
    source s:vim_cache . '/Session.vim'
    let s:sessionloaded = 1
endfunction
function SaveSession()
    if s:sessionloaded == 1
        mksession!
    end
endfunction
autocmd VimLeave * call SaveSession()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vnoremap $1 <esc>`>a)<esc>`<i(<esc>
"vnoremap $2 <esc>`>a]<esc>`<i[<esc>
"vnoremap $3 <esc>`>a}<esc>`<i{<esc>
"vnoremap $$ <esc>`>a"<esc>`<i"<esc>
"vnoremap $q <esc>`>a'<esc>`<i'<esc>
"vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
"inoremap $1 ()<esc>i
"inoremap $2 []<esc>i
"inoremap $3 {}<esc>i
"inoremap $4 {<esc>o}<esc>O
"inoremap $q ''<esc>i
"inoremap $e ""<esc>i
"inoremap $t <><esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Diff mode settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Diff between 2 opened windows
nmap <leader>dt :windo diffthis<cr>

" Diff command shortcuts
nmap <leader>du :diffupdate<cr>
nmap <leader>df :windo diffoff<cr>


""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""
" => CoffeeScript section
"""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
au FileType coffee call CoffeeScriptFold()


"""""""""""""""""""""""""""""""
" => SQL section
"""""""""""""""""""""""""""""""
" FileType related
au BufNewFile,BufRead *.sql,*.btq set filetype=teradata


"""""""""""""""""""""""""""""""
" => ModelBuilder section
"""""""""""""""""""""""""""""""
" FileType related
au BufNewFile,BufRead *.mb set filetype=groovy


"""""""""""""""""""""""""""""""
" => MarkDown section
"""""""""""""""""""""""""""""""
" FileType related
au BufNewFile,BufRead *.md set filetype=markdown


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
nmap <leader>bb :BufExplorer<cr>
nmap <leader>bs :BufExplorerHorizontalSplit<cr>
nmap <leader>bv :BufExplorerVerticalSplit<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
let MRU_File = s:vim_cache . '/_vim_mru_files'
map <leader>u :MRU<CR>


"""""""""""""""""""""""""""""""
" => Powerline
"""""""""""""""""""""""""""""""
"let g:Powerline_symbols = 'fancy'


"""""""""""""""""""""""""""""""""""""
" => Conque settings
"""""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Conque shortcut settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap <silent> <localleader>qs :ConqueTerm /sasadmin/sas92home/SASFoundation/9.2/sas -nodms<cr><esc>:set ft=sas<cr>i
"nmap <silent> <localleader>qb :ConqueTerm bteq<cr>.set width 3000<cr>.logon<esc>:set ft=teradata<cr>i
nmap <silent> <localleader>qp :ConqueTerm ipython<cr>
if has("win16") || has("win32") || has("win64")
    nmap <silent> <localleader>qt :ConqueTerm powershell.exe<cr>
else
    nmap <silent> <localleader>qt :ConqueTerm bash<cr>
endif


""""""""""""""""""""""""""""""
" => YankRing
""""""""""""""""""""""""""""""
let g:yankring_history_dir = s:vim_cache

" ,y to show the yankring
nmap <leader>y :YRShow<cr>

" recommended replacing yk replace keys
let g:yankring_replace_n_pkey = '[k'
let g:yankring_replace_n_nkey = ']k'


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
" allow the ctrlp to start at the folder of current file unless cwd is ancester of current file
let g:ctrlp_working_path_mode = 'a'

" directory for cache files
let g:ctrlp_cache_dir = s:vim_cache . '/ctrlp_cache'

" let g:ctrlp_map = '<C-f>'
" map <C-b> :CtrlPBuffer<cr>
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


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
"ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
"snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated .git'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>
map <leader>nc :NERDTree<space><C-r>=expand('%:p:h')<cr><cr>
cno <expr> $nt getcmdtype() = ':' ? NERDTree : '$nt'
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.swp$', '\.swo$', '\.git', '\.hg', '\.svn', '\.bzr']
"let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext http://amix.dk/blog/post/19678
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdcommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ,/ to invert comment on ther current line/selection
nmap <leader>/ :call NERDComment(0, "invert")<cr>
vmap <leader>/ :call NERDComment(0, "invert")<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gundo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>gu :GundoToggle<cr>


"""""""""""""""""""""""""""""""""
" => omnicomplete settings
"""""""""""""""""""""""""""""""""
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" ctrl+space for omnicompletion
inoremap <C-Space> <C-X><C-O>


"""""""""""""""""""""""""""""""""
" => neocomplcache settings
"""""""""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"            \ 'default' : '',
"            \ 'vimshell' : $HOME.'/.vimshell_hist',
"            \ 'scheme' : $HOME.'/.gosh_completions'
"            \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
inoremap <expr><C-d>  pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
inoremap <expr><C-u>  pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif

let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'


"""""""""""""""""""""""""""""""""""""""
" => neosnippet settings
"""""""""""""""""""""""""""""""""""""""
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)
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
    set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='$HOME/.dotfiles/vim_runtime/bundle/vim-snippets/snippets'


"""""""""""""""""""""""""""""""""""""""""""""
" => Python-mode settings
"""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""
" Pylint configuration file
"""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""
" => Rope refactoring library
"""""""""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-ipython settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable default mappings
let g:ipy_perform_mappings = 0

" Vim-IPython will block other completefunc plugins globally
" using 'local' or anything other than 'global' to change to
" local buffer or disable it.
let g:ipy_completefunc = 'null'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => syntastic settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Jedi-vim settings
" This one should not be used with pymode_rope simultaneously
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => delimitMate settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable <cr> within quotes
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => auto correction settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd filetype markdown,mkd call AutoCorrect()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => numbers settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:enable_numbers = 0
nnoremap <Leader>re :NumbersOnOff<CR>
nnoremap <Leader>rn :NumbersToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => rainbow parentheses settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rbpt_colorpairs = [
    \ ['black',       'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['brown',       'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['red',         'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['brown',       'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ]

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => emmet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

let g:user_emmet_leader_key = '<C-Z>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
