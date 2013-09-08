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
"set t_Co=16
set t_Co=256
set background=dark
colorscheme base16-monokai-transparent
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

" Font
" ------------------------------------------------------------------------

"set guifont=Menlo:h14

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

" NeoBundle
" ------------------------------------------------------------------------

set nocompatible                " be iMproved
filetype off                    " required!
filetype plugin indent off      " required!

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'https://github.com/Shougo/neobundle.vim.git'
NeoBundle 'https://github.com/Shougo/neocomplcache.git'
NeoBundle 'https://github.com/Shougo/unite.vim.git'
NeoBundle 'https://github.com/Shougo/vimfiler.git'
NeoBundle 'https://github.com/Shougo/vimproc.git'
NeoBundle 'https://github.com/Shougo/vimshell.git'

" recommended to install
"NeoBundle 'Shougo/vimproc'
" after install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
"NeoBundle 'Shougo/vimshell'
"NeoBundle 'Shougo/unite.vim'

" My Bundles here:
"
" original repos on github
"NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'Lokaltog/vim-easymotion'
"NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
"NeoBundle 'L9'
"NeoBundle 'FuzzyFinder'
"NeoBundle 'rails.vim'
" non github repos
"NeoBundle 'git://git.wincent.com/command-t.git'
" non git repos
"NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
"NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'

filetype plugin indent on     " required!

" Unite
" ------------------------------------------------------------------------

" Unite prefix key
"nnoremap [unite] <Nop>
"nmap <Space>f [unite]

" 入力モードで開始
let g:unite_enable_start_insert=1

" 最近使用したファイル一覧
noremap <C-U><C-R> :Unite file_mru<CR>
"nnoremap <siltent> [unite]m :<C-u>Unite file_mru<CR>
" ファイル一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>

" Neocomplecache
" ------------------------------------------------------------------------

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
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

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

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" VimShell
" ------------------------------------------------------------------------

nnoremap <silent> vs :VimShell<CR>
let g:vimshell_prompt = '$ '
if has('win32') || has('win64') 
    let g:vimshell_user_prompt = '$USERNAME."@".hostname().": ".fnamemodify(getcwd(), ":~")'
else
    let g:vimshell_user_prompt = '$USER."@".hostname().": ".fnamemodify(getcwd(), ":~")'
endif
"let g:vimshell_right_prompt = 'vimshell#vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
