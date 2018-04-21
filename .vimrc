"Tabをスペース2つに変更
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2

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
set paste

"移動
noremap <C-w>h 5<C-w><
noremap <C-w>l 5<C-w>>

"展開
noremap zo v<S-g>zO

"######NeoBundle##########
"viと互換しない
set nocompatible
filetype plugin indent off

"neobundle管理下のプラグインをruntimepath(プラグインの場所)に追加
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

"# 以下は必要に応じて追加
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'

NeoBundle 'ekalinin/Dockerfile.vim'

NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" HTML 関係のプラグイン
NeoBundle 'surround.vim'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

"#######補完########
let g:neocomplete#enable_at_startup = 1 "起動時に有効
let g:neocomplete#enable_smart_case = 1 "大文字が入力されるまで大文字小文字の区別を無視
let g:neocomplete#sources#syntax#min_keyword_length = 3 "キャッシュされる用になる最小の文字数
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr>x neocomplete#smart_close_popup()."\<C-h>"

" ruby
au BufNewFile *.rb 0r ~/.vim/template/ruby.txt

" markdown
au BufRead,BufNewFile *.md set filetype=markdown

"########タグジャンプ#######
set tags+=./tags
nnoremap <F4> :stj <C-R>=expand('<cword>')<CR><CR> <C-w><S-j>

" setting gtags 
nmap <C-g> :Gtags -g
nmap <C-a> :Gtags -f %<CR>
nmap <C-c> :GtagsCursor<CR>
nmap <C-k> :Gtags -r <C-r><C-w><CR>
nmap <C-l> :cn<CR>
nmap <C-h> :cp<CR>

