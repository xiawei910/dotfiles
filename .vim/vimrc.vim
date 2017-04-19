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

try
    colorscheme jellybeans
catch
    colorscheme desert
endtry

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
"
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

"}}}1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers {{{1
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

"}}}1


