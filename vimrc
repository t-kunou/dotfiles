set encoding=utf8
set fileencoding=utf8
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2

""新しい行のインデントを現在行と同じにする
set autoindent
 
"バックアップファイルのディレクトリを指定する
set backupdir=$HOME/vimbackup
 
"クリップボードをWindowsと連携する
set clipboard=unnamed
  
"vi互換をオフする
set nocompatible
   
"スワップファイル用のディレクトリを指定する
set directory=$HOME/vimbackup
    
"タブの代わりに空白文字を指定する
set expandtab
     
"変更中のファイルでも、保存しないで他のファイルを表示する
set hidden
      
"インクリメンタルサーチを行う
set incsearch
       
"行番号を表示する
set number
        
"閉括弧が入力された時、対応する括弧を強調する
set showmatch
         
"新しい行を作った時に高度な自動インデントを行う
set smarttab
          
" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
           
" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>


set imdisable

let g:mapleader = '\' 

let g:netrw_liststyle = 3
let g:netrw_altv = 1

if has('vim_starting')
  set nocompatible               " Be iMproved
     
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
    
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
     
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
      
" My Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/vimshell.vim'

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
  \ }

" VimからRSecを実行する
NeoBundle "skwp/vim-rspec.git"


" Quickrun
NeoBundle 'thinca/vim-quickrun'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'

NeoBundle 'Shougo/neocomplcache'

NeoBundle 'szw/vim-tags'

" solarizedテーマの導入
NeoBundle 'altercation/vim-colors-solarized'


call neobundle#end()
   
" Required:
filetype plugin indent on
   

"" ファイルオープンを便利に
"NeoBundle 'Shougo/unite.vim'
"" Unite.vimで最近使ったファイルを表示できるようにする
"NeoBundle 'Shougo/neomru.vim'
"
"""""""""""""""""""""""""""""""
"" Unit.vimの設定
"""""""""""""""""""""""""""""""
"" 入力モードで開始する
"let g:unite_enable_start_insert=1
"" バッファ一覧
"noremap <C-P> :Unite buffer<CR>
"" ファイル一覧
"" noremap <C-N> :Unite -buffer-name=file file<CR>
"noremap <C-N> :Unite file_rec<CR>
"" 最近使ったファイルの一覧
"noremap <C-Z> :Unite file_mru<CR>
"" sourcesを「今開いているファイルのディレクトリ」とする
"noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
"" ウィンドウを分割して開く
"au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
"au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
"" ウィンドウを縦に分割して開く
"au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
"au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
"" ESCキーを2回押すと終了する
"au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
"au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
"""""""""""""""""""""""""""""""

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1 

let g:rsenseHome = "/usr/local/Cellar/rsense/0.3/libexec"

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
        \ }


" let g:RspecKeyma,=0
nnoremap <silent> ,rs :RunSpec<CR>
nnoremap <silent> ,rl :RunSpecLine<CR>

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
 endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" quickrunの出力結果にAnsiEscを実行して色付けする
autocmd FileType quickrun AnsiEsc

" quickrunの実行モジュールをvimprocに設定する
let g:quickrun_config = {}
let g:quickrun_config._ = {'runner' : 'vimproc'}

" rspecを実行するための設定を定義する
" %cはcommandに設定した値に置換される
" %oはcmdoptに設定した値に置換される
" %sはソースファイル名に置換される
let g:quickrun_config['rspec/bundle'] = {
  \ 'type': 'rspec/bundle',
  \ 'command': 'rspec',
  \ 'outputter': 'buffered:target=buffer',
  \ 'exec': 'bundle exec %c %o --color --drb --tty %s'
  \}
let g:quickrun_config['rspec/normal'] = {
  \ 'type': 'rspec/normal',
  \ 'command': 'rspec',
  \ 'outputter': 'buffered:target=buffer',
  \ 'exec': '%c %o --color --drb --tty %s'
  \}

" :QuickRunで実行されるコマンドをrspec用の定義に設定する
" <Leader>lrをタイプした時に、:QuickRun -cmdopt "-l (カーソル行)"を実行するキーマップを定義する ← これがポイント
function! RSpecQuickrun()
  let b:quickrun_config = {'type' : 'rspec/bundle'}
  nnoremap <expr><silent> <Leader>lr "<Esc>:QuickRun -cmdopt \"-l " . line(".") . "\"<CR>"
endfunction

" ファイル名が_spec.rbで終わるファイルを読み込んだ時に上記の設定を自動で読み込む
autocmd BufReadPost *_spec.rb call RSpecQuickrun()

" vimgrepの結果を常にQuickFixで開く
autocmd QuickFixCmdPost vimgrep cwindow

" solarizedテーマの適用
"syntax enable
"set background=dark
"colorscheme solarized
