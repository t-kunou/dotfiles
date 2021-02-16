set autoindent
set backupdir=$HOME/vimbackup
set clipboard=unnamed
set directory=$HOME/vimbackup
set encoding=utf8
set expandtab
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
set hidden
set imdisable
set incsearch
set nocompatible
set number
set shiftwidth=2
set showmatch
set smarttab
set tabstop=2

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" Required:
filetype plugin indent on

" vimgrepの結果を常にQuickFixで開く
autocmd QuickFixCmdPost vimgrep cwindow

" for Clojure
au VimEnter * silent! RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare

let g:mapleader = '\' 

let g:netrw_liststyle = 3
let g:netrw_altv = 1

let g:lsp_diagnostics_echo_cursor = 1

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}

" Clojure
" Plug 'guns/vim-clojure-static'
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'tpope/vim-fireplace'
" Plug 'tpope/vim-classpath'

" You can specify revision/branch/tag.
Plug 'Shougo/vimshell', { 'rev' : '3787e5' }

" インデントに色を付けて見やすくする
Plug 'nathanaelkane/vim-indent-guides'

Plug 'Shougo/neocomplcache'
Plug 'szw/vim-tags'

" solarizedテーマの導入
Plug 'altercation/vim-colors-solarized'

Plug 'bronson/vim-trailing-whitespace'

Plug 'Shougo/vimproc.vim', { 'dir': '~/.vim/plugged/vimproc.vim', 'do': 'make' }
Plug 'Shougo/unite.vim'

Plug 'rking/ag.vim'

Plug 'vimplugin/project.vim'

Plug 'itchyny/lightline.vim'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'

Plug 'simeji/winresizer'

Plug 'preservim/nerdtree'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'editorconfig/editorconfig-vim'

Plug 'gorodinskiy/vim-coloresque'

" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

call plug#end()

let g:indent_guides_enable_on_vim_startup = 1 
let g:rsenseHome = "/usr/local/Cellar/rsense/0.3/libexec"
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
        \ }

inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <space><space> :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
" reset not it is <C-l> normally
nnoremap <space>r <Plug>(unite_restart)

" insert modeで開始
" let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" LspHover
nnoremap <silent> ,h  :LspHover<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

nmap & :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag

nnoremap <silent> ,b :<C-u> Unite buffer <CR>

nnoremap <silent> ,n :NERDTreeToggle <CR>
