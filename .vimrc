"ファイルタイプのON/OFFは最初と最後で行う
filetype off
filetype plugin indent off
 
"Tabをスペース2つに変更
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2
set encoding=utf-8

"エスケープを打ちやすく
"移動を少し大きく
noremap <S-j> 10j
noremap <S-h> 10h
noremap <S-k> 10k
noremap <S-l> 10l

"Redo
noremap <S-u> <C-r>

"行数出しておく
set number
syntax on

"移動
noremap <C-w>h 5<C-w><
noremap <C-w>l 5<C-w>>

"展開
noremap zo v<S-g>zO

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" ビープ音を消す
set vb t_vb=

" Plug
"   https://github.com/junegunn/vim-plug
call plug#begin()
  Plug 'scrooloose/nerdtree'
  Plug 'mattn/emmet-vim'
call plug#end()

" NerdTree
"   https://github.com/preservim/nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Emmet
"   https://github.com/mattn/emmet-vim

"ファイルタイプのON/OFFは最初と最後で行う
filetype plugin indent on


