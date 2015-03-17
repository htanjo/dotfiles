" Global
" ------------------------------------------------------------------------

set nocompatible                " vi互換を無効
if has("multi_lang")
    language C                  " UIを英語に
endif
set mouse=a
set ttymouse=xterm2

" File
" ------------------------------------------------------------------------

set noswapfile
set nobackup
"set directory=$HOME/vimbackup
"set backupdir=$HOME/vimbackup
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf8,cp932,euc-jp,iso-2022-jp
set ffs=unix,dos,mac            " LF, CRLF, CR
if exists('&ambiwidth')
    set ambiwidth=double        " UTF-8の□や○でカーソル位置がずれないようにする
endif

" View
" ------------------------------------------------------------------------

syntax enable
set t_Co=256
set background=dark
colorscheme molokai
set autoindent smartindent
set tabstop=4 shiftwidth=4 softtabstop=0
set nowrap
set number                      " 行番号を表示
set list                        " 空白文字を表示
set listchars=eol:$,tab:>\ ,extends:<
set showmatch                   " 対応する括弧をハイライト
set showcmd                     " 入力中のコマンドを表示
set showmode                    " 現在のモードを表示
set cursorline                  " カーソル行をハイライト
augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorline
    autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
hi CursorLine ctermbg=black guibg=black
set statusline=2                " ステータスラインを常に表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
                                " 文字コードと改行コードを表示

" Edit
" ------------------------------------------------------------------------

set expandtab                   " タブの代わりに半角スペースを使用
set clipboard=unnamed           " クリップボードをOSと共有
set whichwrap=b,s,h,l,<,>,[,]   " カーソルを行頭、行末で止まらないようにする

" Search
" ------------------------------------------------------------------------

set incsearch                   " インクリメンタルサーチ
set smartcase                   " 大文字を含んでいたら大/小を区別
nmap <Esc><Esc> :nohlsearch<CR><Esc>    " Esc連打でハイライトを消す
