" My Vim Rc
" Name: Ashfaq Raj

"" ************************** GLOBAL STUFF *****************************

set nocompatible    " use vim defaults

" status line stuff
hi User1 ctermbg=green ctermfg=red   guibg=green guifg=red
hi User2 ctermbg=green ctermfg=red  guibg=red   guifg=blue
hi User3 ctermbg=green ctermfg=red guibg=blue  guifg=green
hi User4 ctermbg=green ctermfg=red   guibg=green guifg=red
hi User5 ctermbg=red   ctermfg=white  guibg=red   guifg=blue
hi User6 ctermbg=blue  ctermfg=green guibg=blue  guifg=green

set ls=2           " allways show status line
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%2*\%{&ff}\ %*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%5*%m%*                "modified flag
set statusline +=%5*\ %=\ row:%l/%L\ (%03p%%)\             "current line
set statusline +=%6*\ col:%03c\             "virtual column number
set statusline +=%5*0x%04B\ %*          "character under cursor

" real programmers dont use tabs, they use spaces
"set list           " Display all Tabs/Ends of lines.
set tabstop=4       " numbers of spaces of tab character
set softtabstop=4
set shiftwidth=4    " numbers of spaces to (auto)indent
set shiftround
set expandtab       " expand tab to spaces


" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <S-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
nnoremap <C-w>     :tabclose<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <S-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>i
inoremap <C-w>     <Esc>:tabclose<CR>
" easiear moving between tabs
"map ,n <Esc>:tabprevious<CR> 
"map ,m <Esc>:tabnext<CR>


set scrolloff=4     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell

"set nobackup        " do not keep a backup file
"set number          " show line numbers

" search case settings
"set ignorecase     " ignore case when searching
set noignorecase    " don't ignore case
set smartcase
set hlsearch        " highlight searches
set incsearch       " do incremental searching

" disable bakup and swap files - they trigger too many events for file systm watchers
" set nobackup
" set nowritebackup
" set noswapfile

set title           " show title in console title bar
set ttyfast         " smoother changes
"set ttyscroll=0        " turn off scrolling, didn't work well with PuTTY
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
"set viminfo='20,<50,s10,h

set autoindent    " set autoindenting ON
set smartindent   " smart indent ON
set cindent       " cindent ON

"set autowrite      " auto saves changes when quitting and swiching buffer
set sm             " show matching braces, somewhat annoying...
"set nowrap         " don't wrap lines
"set history=700    " history of commands
"set undolevels=700 " history of undo levels

syntax  on           " syntax highlighing
if has("gui_running")
" See ~/.gvimrc
set guifont=Monospace\ 10  " use this font
set lines=50       " height = 50 lines
set columns=100        " width = 100 columns
set background=light   " adapt colors for background
set selectmode=mouse,key,cmd
set keymodel=
else
"colorscheme elflord    " use this color scheme
"set background=dark    " adapt colors for background
endif

if has("autocmd")
" Restore cursor position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Filetypes (au = autocmd)
au FileType helpfile set nonumber      " no line numbers when viewing help
au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back

" When using mutt, text width=72
au FileType mail,tex set textwidth=72
au FileType cpp,c,java,sh,pl,php,phtml,asp  set autoindent
au FileType cpp,c,java,sh,pl,php,phtml,asp,xml,javascript  set smartindent
au FileType cpp,c,java,sh,pl,php,phtml,asp  set cindent
"au BufRead mutt*[0-9] set tw=72

" Automatically chmod +x Shell and Perl scripts
au BufWritePost   *.sh             !chmod +x %
au BufWritePost   *.py             !chmod +x %

" File formats
au BufNewFile,BufRead  *.phtml  set syntax=php
au BufNewFile,BufRead  *.pls    set syntax=dosini
au BufNewFile,BufRead  modprobe.conf    set syntax=modconf

" Ctrl+X O
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

autocmd FileType php noremap <C-L> :!php -l %<CR>
autocmd Filetype html,xml,xsl source ~/.vim/closetag.vim
endif

" Keyboard mappings
"map <F1> :previous<CR>  " map F1 to open previous buffer
"map <F2> :next<CR>      " map F2 to open next buffer
"map <silent> <C-N> :silent noh<CR> " turn off highlighted search
"map ,v :sp ~/.vimrc<cr> " edit my .vimrc file in a split
"map ,e :e ~/.vimrc<cr>      " edit my .vimrc file
"map ,u :source ~/.vimrc<cr> " update the system settings from my vimrc file
"map ,h :source $VIM/vim70/syntax/2html.vim<cr>:w<cr>:clo<cr> "----- write out html file



" tab and reverse tab
:vmap <Tab> >
:vmap <S-Tab> <
" visual select to multiple line indent-dedent
vnoremap < <gv
vnoremap > >gv
" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv
" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>


" replace the pattern 'p' with string 'r'
" map s :%s/p/r/g
" map t :1<cr> " goto top of file
" map b :$<cr> " goto bottom of file

"common command line typos
"cmap W w
cmap Q q

" Keyboard mapping for numeric keypad
imap <Esc>OM <c-m>
map <Esc>OM <c-m>
imap <Esc>OP <nop>
map <Esc>OP <nop>
imap <Esc>OQ /
map <Esc>OQ /
imap <Esc>OR *
map <Esc>OR *
imap <Esc>OS -
map <Esc>OS -

imap <Esc>Ol +
imap <Esc>Om -
imap <Esc>On ,
imap <Esc>Op 0
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Oz 0


nnoremap <C-p> :set invpaste paste?<CR>
set paste
set pastetoggle=<C-p>
set clipboard=unnamed " better copy-paste vim <--> outside world
set showmode

:highlight Comment ctermfg=blue
" :highlight Comment ctermfg=green
" :highlight Comment ctermfg=yellow

autocmd! bufwritepost .vimrc source %  " automatc reloading/sourcing of .vimrc

"mouse and backspace
"set mouse=a " on OSX press ALT and click
"set bs=2    " make backspace works normally again

" rebind new <leader> key
let mapleader = ","

" bind nohl - removes highlights of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" quick save with <ctrl-z>
noremap <C-z> :update<CR>
inoremap <C-z> <Esc>:w<CR>a
vnoremap <c-z> <Esc>:w<CR>

filetype plugin on
filetype indent on



"" ************** auto completion using TAB *************************
" make tab autocomplete :) http://www.vim.org/tips/tip.php?tip_id=102
function! InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
          return "\<tab>"
      else
          return "\<c-p>"
      endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>


"" ************************** PROGRAMING STUFF *****************************
autocmd BufNewFile *.pm 0r ~/.vim/skeleton/perl.skl
autocmd BufNewFile *.pl 0r ~/.vim/skeleton/perl.skl
autocmd BufNewFile *.py 0r ~/.vim/skeleton/python.skl

" ~/.vim/ftdetect/usr_bin_env.vim
fun s:DetectFileType()
    let tokens = split(getline(1))
    
    "" ************************** PERL STUFF *****************************
    if tokens[0]=~ ".*perl.*" || tokens[1]=="perl"
        echo "ashfaq raj this is a perl programs"
        "setfiletype tokens[1]
        set number
        
        " chmod to exectable on write on .pl and .pm file
        au BufWritePost * !chmod +x %
        
        " compile the perl program on write
        " autocmd BufWritePost * !perl -wcIlib % if match(getline(1),"perl") >= 0 | set filetype=perl | endif
        au BufWritePost *.pl,*.pm !perl -wcIlib %

        " set perl block folding methods
        syntax on
        "filetype plugin on
        "filetype plugin indent on
        let perl_include_pod             = 1
        let perl_extended_vars           = 0
        let perl_want_scope_in_variables = 1
        let perl_fold                     = 1
        let perl_fold_blocks              = 1

        set foldenable
        set viewoptions=folds,options,cursor
        set fdc=2 " fdc: fold column
        set fdn=2 " fdn: fold nest max
        set fdl=3 " fdl: fold level
        set foldmethod=syntax
        set foldmethod=marker
        set foldmarker={,}
        "autocmd FileType perl set foldmethod=marker
        "autocmd FileType perl set foldmarker={,}
        nnoremap ,1 zM " close all folds
        nnoremap ,2 zR " open all folds

        " comment/uncomment blocks of code (in vmode)
        vmap ,c :s/^/#/gi<CR>:nohl<CR>
        vmap ,u :s/^#//gi<CR>:nohl<CR>

        " cut/copy/paste shortcut in virtual mode
        vmap <C-c> yy
        nmap <C-v> <Esc>p<Esc>
        vmap <C-x> d

        "check perl code with :make
        set makeprg=perl\ -c\ %\ $*
        set errorformat=%f:%l:%m
        set autowrite
    endif


    "" ************************** PYTHON STUFF *****************************
    if tokens[0]=~ ".*python.*" || tokens[1]=="python"
        " echo "ashfaq raj this is a python program. you can continue !!"
        " setfiletype tokens[1]
        
        set viewoptions=folds,options,cursor
        set fdc=2 " fdc: fold column
        set fdn=2 " fdn: fold nest max
        set fdl=3 " fdl: fold level

        " autocmd FileType python runtime! autoload/pythoncomplete.vim
        
        " run program from inside vim (3 methods)
        " 1. execute program showing shell screen
        "autocmd Filetype python nnoremap <buffer> <F9> :exec '!python'<cr> shellescape(@%, 1)<cr>
        " 2. execute program from vim screen
        nnoremap <C-e> <Esc><Esc>:w<cr>:!clear<CR>:!python %<CR>
        inoremap <C-e> <Esc><Esc>:w<cr>:!clear<CR>:!python %<CR>
        " 3. execute program from vim screen --> on a clear screen
        "nnoremap <C-r> <Esc>:w !clear;python<CR>
        
        " python-mode, close preview after function selection
        autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
        autocmd InsertLeave * if pumvisible() == 0|pclose|endif

        " comment/uncomment blocks of code (in vmode)
        vmap ,c :s/^/#/gi<CR>:nohl<CR>
        vmap ,u :s/^#//gi<CR>:nohl<CR>

        " cut/copy/paste shortcut in virtual mode
        vmap <C-c> yy
        nmap <C-v> <Esc>p<Esc>
        vmap <C-x> d

        nnoremap ,1 zM " close all folds
        nnoremap ,2 zR " open all folds
    endif
endfun
autocmd BufNewFile,BufRead * call s:DetectFileType()


" *********** MISC VIM RC COMMANDS & HELP
":tabedit {file}   edit specified file in a new tab
":tabfind {file}   open a new tab with filename given, searching the 'path' to find it
":tabclose         close current tab
":tabclose {i}     close i-th tab
":tabonly          close all other tabs (show only the current tab)
":tab ball         show each buffer in a tab (up to 'tabpagemax' tabs)
":tab help         open a new help window in its own tab page
":tab drop {file}  open {file} in a new tab, or jump to a window/tab containing the file if there is one
":tab split        copy the current window to a new tab of its own
":tabs         list all tabs including their displayed windows
":tabm 0       move current tab to first
":tabm         move current tab to last
":tabm {i}     move current tab to position i+1
":tabn         go to next tab
":tabp         go to previous tab
":tabfirst     go to first tab
":tablast      go to last tab
"In normal mode, you can type:
"gt            go to next tab
"gT            go to previous tab
"{i}gt         go to tab in position i
"When using gvim, in normal mode and in insert mode, you can type:
"Ctrl-PgDn     go to next tab
"Ctrl-PgUp     go to previous tab

"set switchbuf=usetab
"nnoremap <F8> :sbnext<CR>
"nnoremap <S-F8> :sbprevious<CR>
"If you prefer to open a new tab instead of a new split window, you can set switchbuf to usetab,newtab.

"ShortcutsEdit
"nnoremap <C-Left> :tabprevious<CR>
"nnoremap <C-Right> :tabnext<CR>
"nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
"nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

"The following command abbreviation allows typing :tabv myfile.txt to view the specified file in a new tab; the buffer is read-only and nomodifiable so you cannot accidentally change it.
