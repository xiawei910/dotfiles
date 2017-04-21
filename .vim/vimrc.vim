" Vim configure
" Use 'za' to fold or unfold the text.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" fold this VIM file.
autocmd FileType vim setlocal foldmethod=marker

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" TODO
" Storage settings
let s:vim_cache = expand('$HOME/.vim_tmp')
if filewritable(s:vim_cache) == 0 && exists("*mkdir")
    call mkdir(s:vim_cache, "p", 0700)
endif

"}}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Windows layout {{{2

" Add a bit extra margin to the left
set foldcolumn=1

" toggle of line numbers
set number
set numberwidth=3

" Height of the command bar
set cmdheight=2

"Always show current position
set ruler

" Set 5 lines to the cursor - when moving vertically using j/k
set scrolloff=5

" highlight current line
set cursorline

" windows can be 0 line high
set winminheight=0

" A buffer becomes hidden when it is abandoned
set hidden

" allow for cursor beyond last character
set virtualedit=onemore

" TODO
" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Allow specified keys that move the cursor left/right to move to the
" previous/next line when the cursor is on the first/last character in
" the line.
set whichwrap+=<,>,h,l



" => Status line {{{2

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
set statusline+=%{&fileformat!='unix'?'['.&fileformat.']':''}
set statusline+=%*

" display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fileencoding!='utf-8'&&&fileencoding!='')?'['.&fileencoding.']':''}
set statusline+=%*

"set statusline+=%h "help file flag
set statusline+=%y "filetype

" git hotness
"set statusline+=%{fugitive#statusline()}

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



" => Statusline Helper functions {{{2

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



" => TabLine settings {{{2

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

set showtabline=2
if exists("+showtabline")   
    set tabline=%!TabLineStyle()
endif



" => Search & match {{{2

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2



" => Beep {{{2

" No annoying sound on errors
set noerrorbells
set visualbell t_vb=



" => File Type {{{2

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,bg18030,gbk,big5

" Use Unix as the standard file type
set fileformats=unix,dos,mac

" Add some common encodings to be readable
set fileencodings=ucs-bom,utf-8,default,cp936,gb18030,utf-16,utf-16le,big5,euc-jp,euc-kr,latin1



" => GUI related {{{2

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



"}}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts {{{1
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

"}}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo {{{1
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


" => wild {{{2
" TODO
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

" abbrev. of messages (avoids 'hit enter')
set shortmess+=filmnrxoOtT

" better unix / windows compatibility
set viewoptions=folds,options,cursor,unix,slash

"}}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype indent on

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

" highlight problematic whitespaces
set nolist
set listchars=tab:>-,trail:.,extends:>,nbsp:.
autocmd FileType c,cpp,java,php,javascript,python,xml,html,teradata,sas setlocal list

" No double spaces when joining lines after ".", "?", "!"
set nojoinspaces



" => Parenthesis/bracket {{{2
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

"}}}2



"}}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap VIM 0 to first non-blank character
"map 0 ^
map <Home> ^

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

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" change windows size
"nmap <C-_> <C-W>_
"nmap <M-Up> <C-W>+
"nmap <M-Down> <C-W>-
"nmap <M-Right> <C-W>>
"nmap <M-Left> <C-W><

" Move window position
map <C-Up> <C-W>K
map <C-Down> <C-W>J
map <C-Left> <C-W>H
map <C-Right> <C-W>L

" Control where to put the new split window
set splitbelow
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
map <leader>tm :tabmove<cr>
map <leader>tl :tabnext<cr>
map <leader>tt :tabnext<cr>
map <leader>tp :tabprevious<cr>

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
     \   execute "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
"nmap <M-j> mz:m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"if has("mac") || has("macunix")
  "nmap <D-j> <M-j>
  "nmap <D-k> <M-k>
  "vmap <D-j> <M-j>
  "vmap <D-k> <M-k>
"endif

"}}}1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Insert/Visual/Command/Diff mode related {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Insert mode related {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map Alt-Space to underscore
" somehow these dont work
"inoremap <M-Space> _
"cnoremap <M-Space> _

" Add undo point before Ctrl-U deletes the whole line
inoremap <C-U> <C-G>u<C-U>

"}}}2



" => Visual mode related {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


" => vimgrep searching {{{3
" When you press <leader>gg you vimgrep after the selected text
vnoremap <silent> <leader>gg :call VisualSelection('grep', '')<CR>

" When you press <leader>gr you can search and replace the selected text
vnoremap <silent> <leader>gr :call VisualSelection('replace', '')<CR>

" Open vimgrep and put the cursor in the right position
nnoremap <leader>gd :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
nnoremap <leader>gc :vimgrep // <C-R>%<C-A>

"}}}3

"}}}2



" => Command mode related {{{2
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

"}}}2



" => Diff mode settings {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Diff between 2 opened windows
nmap <leader>dt :windo diffthis<cr>

" Diff command shortcuts
nmap <leader>du :diffupdate<cr>
nmap <leader>df :windo diffoff<cr>

"}}}2



"}}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Hot Keys {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Time allowed for a seris of key strokes
set timeoutlen=600

" Fast saving
nmap <leader>w :w!<cr>

" For when you forget to sudo
cmap w!! w !sudo tee % > /dev/null

" toggle of line numbers
map <leader>ln :setlocal number!<cr>

" highlight problematic whitespaces
map <leader>li :setlocal list!<cr>

" fast change fileencode and fileformat to unix/utf8
nmap <leader>8 :set ff=unix fenc=utf-8<cr>

map <leader>wr :setlocal wrap!<cr>

" Count the number of researching pattern
map <leader>gn :%s///gn<cr>

" Disable highlight when <leader>h is pressed
map <silent> <leader>h :noh<cr>

" copy to system clipboard
vmap <leader>y "+y

" => quickfix and location list window {{{2

" When you search with vimgrep, display your results in cope by doing:
map <leader>vv :botright cope<cr>

" Copy the whole quickfix window to a new tab
map <leader>vo ggVGy:tabnew<cr>:set syntax=qf<cr>pgg

" Move between location list. Covered by unimpaired [|]q etc
"map <localleader>n :cn<cr>
"map <localleader>p :cp<cr>

"}}}2

" Pressing ,zz will toggle and untoggle spell checking
map <leader>zz :setlocal spell!<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" easier increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Map Space for folding
map <Leader><Space> za

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" => Editing mappings {{{2

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

"}}}2

" => Fast editing and reloading of vimrc configs {{{2

nnoremap <leader>ev :e! $MYVIMRC<cr>
nnoremap <leader>ee :e! $HOME/.vim/vimrcs/vimrc.vim<cr>
"autocmd! bufwritepost vimsourcerc source $MYVIMRC
nnoremap <leader>sv :source $MYVIMRC<cr>

"}}}2

"}}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"chinese support
"set fileencodings=utf-8,chinese,cp936
"language messages zh_CN.utf-8
if has("gui_running")
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif

" enable matchit
runtime macros/matchit.vim

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
        au BufWritePre /tmp/* setlocal noundofile
        "au BufWritePre COMMIT_EDITMSG setlocal noundofile
        "au BufWritePre .vim-aside setlocal noundofile
    augroup END
endif

" Map ½ to something useful
map ½ $
cmap ½ $
imap ½ $

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Session control
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:session_file = s:vim_cache . '/session.vim'
nmap <leader>ss :mks! s:session_file<cr>
nmap <leader>ls :call LoadSession()<cr>
" if session is loaded after vim is started, save it when exit
let s:sessionloaded = 0
function LoadSession()
    source s:session_file
    let s:sessionloaded = 1
endfunction
function SaveSession()
    if s:sessionloaded == 1
        mksession! s:session_file
    end
endfunction
autocmd VimLeave * call SaveSession()

"}}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Visual mode helper func {{{2

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

"}}}2



" => Command mode helper func {{{2

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

"}}}2



" => Status Line Helper func {{{2

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

"}}}2



"}}}1
