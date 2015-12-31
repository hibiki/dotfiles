" ファイルタイププラグインを有効にする
"---------------------------------------------------------------------------
filetype plugin indent on


" 基本設定
"---------------------------------------------------------------------------

set hidden							" 変更中のファイルでも、保存しないで他のファイルを表示
set whichwrap=b,s,h,l,<,>,[,]		" カーソルを行頭、行末で止まらないようにする
set backspace=indent,eol,start		" バックスペースでインデントや改行を削除できるようにする
set nrformats-=octal				" CTRL-A で8進数の計算をさせない
set wildmenu						" コマンドラインモードでtabで補完

set backupdir=$HOME/.vimdir/backup	" バックアップファイルを作るディレクトリ
set directory=$HOME/.vimdir/swap	" スワップファイル用のディレクトリ
set viewdir=$HOME/.vimdir/view		" viewdir(:mkviewで利用)用のディレクトリ

" ファイルを上書きする前にバックアップを作る。書き込みが成功してもバックアップはそのまま取っておく。（有効:backup/無効:nobackup）
set nobackup
" ファイルの上書きの前にバックアップを作る。オプション 'backup' がオンでない限り、バックアップは上書きに成功した後削除される。（有効:writebackup/無効:nowritebackup）
set writebackup
" ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 


" 表示
"---------------------------------------------------------------------------

set tags=tags			" tagsを利用する
set shellslash			" \ (バックスラッシュ)を / (スラッシュ)に変更
set number				" 行番号を表示する
set showmatch			" 閉じ括弧が入力されたとき、対応する括弧を表示する
set laststatus=2		"ステータスラインを常に表示
set cursorline			"カーソル行下線（「set cursorline」がある場合に有効）
set list				" タブ文字を CTRL-I で表示し、行末に $ で表示する。（有効:list/無効:nolist）

"ステータスラインに文字コードと改行文字を表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" Listモード (訳注: オプション 'list' がオンのとき) に使われる文字を設定する。（eol:$とか）
set listchars=tab:>-,trail:-,nbsp:-,extends:>,precedes:<


" タブ・インデント
"---------------------------------------------------------------------------

set shiftwidth=2		" シフト移動幅
set smartindent			" 新しい行を作ったときに高度な自動インデントを行う
set smarttab			" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set autoindent			" 新しい行のインデントを現在行と同じにする
set copyindent			" 新しい行にインデントを自動挿入する際、既存行のインデント構造をコピーする
set preserveindent		" 現在行のインデント量を調整する際、すでにある部分はインデント構造を保つ
set noexpandtab			" タブを利用する（タブ入力でスペースに変換したい場合は set expandtab）

" js ではタブ入力した場合スペースにする
autocmd BufNewFile,BufRead *.js setlocal expandtab shiftwidth=2 softtabstop=2
set autoindent

"タブ幅をリセット
au BufNewFile,BufRead * set tabstop=2 shiftwidth=2


" 検索
"---------------------------------------------------------------------------

set ignorecase		" 検索時に大文字小文字を無視
set smartcase		"検索時に大文字を含んでいたら大/小を区別
set incsearch		" インクリメンタルサーチを行う

" gh で検索文字列のハイライト解除 
nnoremap <silent> gh :let @/=''<CR>


" その他
"---------------------------------------------------------------------------

" LeaderをSpaceにする
let mapleader = "\<Space>"

" IMEをデフォルトでオフ（Windows）
if has('win32')
	au BufNewFile,BufRead * set iminsert=0
endif

" *.txt なファイルを編集するときに長い行で勝手に改行が入ってしまう場合に，それを止める方法
autocmd BufRead *.txt set tw=0

" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" Hack #84: バッファの表示設定を保存する
" http://vim-jp.org/vim-users-jp/2009/10/08/Hack-84.html
" 保存先は set viewdir 部分参照
" Save fold settings.
autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
" Don't save options.
set viewoptions-=options

" Hack #22: XMLの閉じタグを補完するようにする
" http://vim-users.jp/2009/06/hack22/
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype xhtml inoremap <buffer> </ </<C-x><C-o>
augroup END

" vimでquickfixを自動で開く
" http://webtech-walker.com/archive/2009/09/29213156.html
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep if len(getqflist()) != 0 | copen | endif

" 'cursorline' を必要な時にだけ有効にする 
" http://d.hatena.ne.jp/thinca/20090530/1243615055
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorline
  autocmd CursorHold,CursorHoldI * setlocal cursorline
augroup END

"相対URLでもgfで開けるように
autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/


":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" キー割当系
"---------------------------------------------------------------------------
" ▽map 系コマンド (再帰的処理あり)
" ※演算待ち＝オペレーターペンディングモード
" ※コマンド＝コマンドラインモード
" その他は :help で
"
" |        | ノーマル |ビジュアル| 演算待ち |   挿入   | コマンド |
" |--------|----------|----------|----------|----------|----------|
" |map     |    ○    |    ○    |    ○    |          |          |
" |map!    |          |          |          |    ○    |    ○    |
" |nmap    |    ○    |          |          |          |          |
" |vmap    |          |    ○    |          |          |          |
" |omap    |          |          |    ○    |          |          |
" |imap    |          |          |          |    ○    |          |
" |cmap    |          |          |          |          |    ○    |
"---------------------------------------------------------------------------
" ▽map 系 (再帰的処理あり) と noremap 系 (再帰的処理なし)
" |   map 系   | noremap 系 |
" |------------|------------|
" |     map    |   noremap  |
" |    map!    |  noremap!  |
" |    nmap    |  nnoremap  |
" |    vmap    |  vnoremap  |
" |    omap    |  onoremap  |
" |    imap    |  inoremap  |
" |    cmap    |  cnoremap  |
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

" gvimrc の設定環境変数
let $MYGVIMRC = '$HOME/dotfiles/.gvimrc'

" gvimrcを即座に開く
nnoremap <Leader>.
\        :<C-u>edit $MYGVIMRC<CR>

" gvimrcを即座にリロード
" 専用ホットキーを定義する場合
" <Space>s.でリロード
nnoremap <Leader>s.
\        :<C-u>source $MYGVIMRC<CR>

" vimrc の設定環境変数
let $MYVIMRC = '$HOME/dotfiles/.vimrc'

" vimrcを即座に開く
nnoremap <Leader>/
\        :<C-u>edit $MYVIMRC<CR>

" help を引きやすくする
nnoremap <C-h> :<C-u>help<Space>

" カーソル下のキーワードを help で引けるようにする
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Enter>

" 括弧の補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" xキーで削除した際にヤンクの内容が上書きされないようにしておく
noremap PP "0p
noremap x "_x

" 表示行単位で移動するようにする
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Esc を jj に割り当てとく
inoremap jj <Esc>
onoremap jj <Esc>
inoremap j<Leader> j
onoremap j<Leader> j

" 検索結果に移動したとき、その位置を画面の中央に
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

map! <C-B> <Left>			" Ctrl+Bで一文字戻る
map! <C-D> <Del>			" Ctrl+Dでカーソルの下の文字を削除

imap <C-k> <ESC>"*pa		" 挿入モードでクリップボードの内容を貼り付ける
imap <C-p> <ESC>pa			" 挿入モードで無名レジスタを貼り付ける
noremap <C-p> "0p			" Ctrl-p で "0p を貼り付ける
vmap <C-c> "+y				" Ctrl-c でクリップボードにコピー

" <Space>pと<Space>yでシステムのクリップボードにコピー＆ペーストする
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" 改行抜きで一行クリップボードにコピー
nnoremap <Leader>y 0v$h"+y

" Ctrl-X Ctrl-Oで補完リストの表示 -> Shift-Spaceで表示
imap <S-Space> <C-X><C-O>

" 先頭と最後に移動を変更
noremap 0 _

" 行連結でスペースを入れない
noremap J gJ
noremap gJ J

" 検索レジスタで検索
nmap g/ :exec ':vimgrep /' . getreg('/') . '/j %\|cwin'<CR>
nmap G/ :silent exec ':bufdo vimgrepadd /' . getreg('/') . '/j %'<CR>\|:silent cwin<CR>

" 日付の入力補完
inoremap <expr> ,df strftime('%Y-%m-%dT%H:%M:%S')
inoremap <expr> ,dd strftime('%Y-%m-%d')
inoremap <expr> ,dt strftime('%H:%M:%S')

" 最後に変更したテキストの選択
nnoremap gc  `[v`]
vnoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>

" tabでインデント、Shift+tabでアンインデント
inoremap <S-Tab> <C-O><LT><LT>
nnoremap <Tab> >>
nnoremap <S-Tab> <LT><LT>
vnoremap <Tab> >
vnoremap <S-Tab> <LT>

" レジスタ/マークの確認を楽にする
nnoremap <Leader>m  :<C-u>marks
nnoremap <Leader>r  :<C-u>registers

" very magic を利用することに変更
" Vimでパターン検索するなら知っておいたほうがいいこと - derisの日記
" http://deris.hatenablog.jp/entry/2013/05/15/024932
nnoremap /  /\v

" tab → &nbsp; *4
nnoremap <Leader>st <S-v>:s/\t/\&nbsp;\&nbsp;\&nbsp;\&nbsp;/g<CR>:let @/=''<CR>
vnoremap <Leader>st :s/\t/\&nbsp;\&nbsp;\&nbsp;\&nbsp;/g<CR>:let @/=''<CR>

" html エスケープ
" http://liosk.blog103.fc2.com/blog-entry-187.html
function! s:EscapeXml(regname)
  let x = getreg(a:regname)
  let x = substitute(x, '&', '\&amp;', 'g')
  let x = substitute(x, '<', '\&lt;', 'g')
  let x = substitute(x, '>', '\&gt;', 'g')
  let x = substitute(x, "'", '\&apos;', 'g')
  let x = substitute(x, '"', '\&quot;', 'g')
  call setreg(a:regname, x)
endfunction
vnoremap <Leader>e "xx:call <SID>EscapeXml('x')<CR>"xP

" :w :q
nnoremap <Leader>w :<C-u>w<CR>
nnoremap <Leader>q :<C-u>q<CR>

" yeでそのカーソル位置にある単語をレジスタに追加
nmap ye :let @"=expand("<cword>")<CR>

" <Space><Space>でビジュアルラインモードに切り替える
nmap <Leader><Leader> V

" 貼り付けたテキストの末尾へ自動的に移動する（複数行貼り付けが楽）
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" タブ操作
" tab pagesを使い易くする
"http://whileimautomaton.net/2008/08/vimworkshop3-kana-presentation
"nnoremap ,t  <Nop>
nnoremap [tab] <Nop>
nmap     <Leader>t [tab]
nnoremap [tab]n  :<C-u>tabnew<CR>
nnoremap [tab]c  :<C-u>tabclose<CR>
nnoremap [tab]o  :<C-u>tabonly<CR>
nnoremap [tab]j  :<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>
nnoremap [tab]k  gT

" 隣のタブへ移動
nnoremap L gt
nnoremap H gT

" バッファ操作
" F9: バッファ削除
nnoremap b  <Nop>
nnoremap bc :<C-u>bwipe<CR>

"カーソル位置の単語検索
nmap <C-g><C-w> :grep "<C-R><C-W>" *.c *.h *.php *.html *.shtml *.js *.css *.sql<CR>
nmap <C-g><C-a> :grep "<C-R><C-A>" *.c *.h *.php *.html *.shtml *.js *.css *.sql<CR>
nmap <C-g><C-h> :grep "<C-R>/" *.c *.h *.php *.html *.shtml *.js *.css *.sql<CR>

"ビジュアルモード時vで行末まで選択
" http://blog.blueblack.net/item_317
vnoremap v $h

" $の入力を楽にする
inoremap <C-d> $

" 「:Utf8」で、ファイルを UTF-8 で開き直す
" http://whileimautomaton.net/2008/08/vimworkshop3-kana-presentation
command! -bang -nargs=? Utf8
\ edit<bang> ++enc=utf-8 <args>

" 貼り付け時にペーストバッファが上書きされないようにする
" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" plugin
"   キー割当等、設定
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

" proc
"---------------------------------------------------------------------------
if has('mac')
"let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/vimproc_mac.so'
elseif has('win64')
let g:vimproc_dll_path = $HOME . '\.vim\autoload\vimproc_win64.dll'
endif


" NERDTree
"---------------------------------------------------------------------------
" ディレクトリとファイルをツリー表示
nnoremap <F1> :NERDTreeToggle<CR>
nnoremap <F2> :NERDTree<CR>


" showmarks
"---------------------------------------------------------------------------
let g:showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"


" Zencoding.vim -> Emmet.vim
"---------------------------------------------------------------------------
au BufRead,BufNewFile *.scss set filetype=scss
let g:user_emmet_expandabbr_key = "<C-e>"
"let g:user_zen_togglecomment_key = "<C-e>/"
let g:use_emmet_complete_tag = 1
" zen-coding の設定
let g:user_emmet_settings = {
\  'lang' : 'ja',
\  'html' : {
\    'filters' : 'html',
\    'snippets' : {
\      'jq' : "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js\"></script>\n<script>\n\\$(function() {\n\t|\n})()\n</script>",
\      'cd' : '<![CDATA[|]]>',
\    },
\    'empty_element_suffix': '>',
\    'indentation' : '',
\  },
\  'scss' : {
\    'snippets' : {
\      'img' : '<img src="|" alt="">',
\      'fzz' : 'font-size: fs(|,13);',
\      'm': 'margin: |;',
\      'm:a': 'margin: auto;',
\      'mt': 'margin-top: |;',
\      'mt:a': 'margin-top: auto;',
\      'mr': 'margin-right: |;',
\      'mr:a': 'margin-right: auto;',
\      'mb': 'margin-bottom: |;',
\      'mb:a': 'margin-bottom: auto;',
\      'ml': 'margin-left: |;',
\      'ml:a': 'margin-left: auto;',
\      'p': 'padding: |;',
\      'pt': 'padding-top: |;',
\      'pr': 'padding-right: |;',
\      'pb': 'padding-bottom: |;',
\      'pl': 'padding-left: |;',
\      'w': 'width: |;',
\      'w:a': 'width: auto;',
\      'h': 'height: |;',
\      'h:a': 'height: auto;',
\      'pos:s': 'position: static;',
\      'pos:a': 'position: absolute;',
\      'pos:r': 'position: relative;',
\      'pos:f': 'position: fixed;',
\      'c': 'color: #|;',
\    },
\    'indentation' : ' ',
\  },
\}


" neocomplcache
"---------------------------------------------------------------------------
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
"imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()

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


" unite.vim
"---------------------------------------------------------------------------
let g:unite_enable_start_insert=1			" 入力モードで開始する
let g:unite_source_history_yank_enable = 1 	"history/yankの有効化

nnoremap [unite]    <Nop>
nmap     <Leader>u [unite]
"nmap     ,u [unite]
" バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> <C-Tab> :<C-u>Unite buffer<CR>
"nnoremap <silent> <C-p> :<C-u>Unite buffer<CR>
" ファイル一覧 - file_current_dir
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" ファイル一覧 - current_dir（再帰的、プレビュー付き）
nnoremap <silent> [unite]p :<C-u>Unite file_rec -auto-preview<CR>
" レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> [unite]u :<C-u>Unite buffer file_mru<CR>
"nnoremap <silent> <C-n> :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" yank
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>
nnoremap <silent> <Leader>y :<C-u>Unite history/yank<CR>
inoremap <silent> <C-y> <Esc>:Unite history/yank<CR>
" ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
" ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
" UniteBookMarkAdd で追加したディレクトリを Unite bookmark で開くときのアクションのデフォルトを Vimfiler に
"call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
" Unite-grep
nnoremap <silent> [unite]g :Unite grep:%:-iHRn<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
au FileType unite nnoremap <silent> <buffer> <C-e> :q<CR>
au FileType unite inoremap <silent> <buffer> <C-e> <ESC>:q<CR>

" unite-colorscheme.vim
let g:unite_enable_start_insert = 1
let g:unite_enable_split_vertically = 1
if globpath(&rtp, 'plugin/unite.vim') != ''
  nnoremap sc :<C-u>Unite colorscheme<Cr>
endif

" :Unite reanimate の呼び出し時に default-action を設定
" 復元
nnoremap <silent> [unite]s :Unite reanimate -default-action=reanimate_load<CR>
" 保存
nnoremap <silent> [unite]S :Unite reanimate -default-action=reanimate_save<CR>


" VimFiler
"---------------------------------------------------------------------------
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1
" vimfiler をサクサク起動する
nnoremap [vimfiler]    <Nop>
nmap     <Leader>f [vimfiler]
nnoremap <silent> [vimfiler]f :<C-u>VimFiler<CR>
"現在開いているバッファのディレクトリを開く
nnoremap <silent> [vimfiler]d :<C-u>VimFilerBufferDir -quit<CR>
"現在開いているバッファをIDE風に開く -no-quit すると自動で閉じない
nnoremap <silent> [vimfiler]t :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -quit<CR>
"デフォルトのキーマッピングを変更
augroup vimrc
  autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END
function! s:vimfiler_my_settings()
  nmap <buffer> q <Plug>(vimfiler_exit)
  nmap <buffer> Q <Plug>(vimfiler_hide)
  nmap <buffer> <C-e> <Plug>(vimfiler_hide)
endfunction


" VimShell
"---------------------------------------------------------------------------
" vimshell setting
if has('win32') || has('win64')
  let g:vimshell_prompt = $USERNAME."% "
else
  let g:vimshell_prompt = $USER . "@" . hostname() . "% "
endif
" シェルを起動
nnoremap <silent> <Leader>vs :VimShell<CR>


" smartchr
"---------------------------------------------------------------------------
"inoremap <expr> = smartchr#loop(' = ', ' == ', '=')
autocmd FileType css inoremap <expr> : smartchr#loop(': ', ':')
"autocmd FileType css inoremap <expr> / smartchr#loop('/', '//', '/*  */<Left><Left><Left>')
autocmd FileType css inoremap <expr> / smartchr#loop('/', '//', '/*  */')
"autocmd FileType scss inoremap <expr> / smartchr#loop('/', '/*  */<Left><Left><Left>', '//')
"
"autocmd FileType php inoremap <expr> = smartchr#one_of(' = ', ' == ', ' === ', '=')
"autocmd FileType javascript inoremap <expr> = smartchr#one_of(' = ', ' == ', ' === ', '=')
"
"autocmd FileType xhtml inoremap <expr> = smartchr#one_of('=""<Left>', '=')
"autocmd FileType html inoremap <expr> = smartchr#one_of('=""<Left>', '=')
inoremap <expr> " smartchr#loop('"', '""', "'", "''")
"inoremap <expr> = smartchr#one_of(' = ', ' == ', ' === ', '=')


" easymotion.vim: 
"---------------------------------------------------------------------------
let g:EasyMotion_leader_key = ','


" lightline.vim
"---------------------------------------------------------------------------
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ }
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'unite' ? 'Unite' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0


" endtagcomment.vim 閉じタグ用
"---------------------------------------------------------------------------
" let g:endtagcommentFormat = '<!-- /%tag_name%id%class -->'
let g:endtagcommentFormat = '<!-- / %id%class -->'
" http://twitter.com/#!/kosei27/status/10625078672756736
" class名変えたりしたときは、既存のコメント消した後で追加
nnoremap <Leader>e ^df> :<C-u>call Endtagcomment()<CR>
"nnoremap <Leader>, :<C-u>call Endtagcomment()<CR>
inoremap <Leader>e <Esc>:<C-u>call Endtagcomment()<CR>


" savevers.vim 編集履歴を自動ナンバリングで記録
"---------------------------------------------------------------------------
set backup
set patchmode=.clean
let savevers_types = "*"
let savevers_dirs = &backupdir
let versdiff_no_resize=1
nmap <silent> <F5> :VersDiff -<cr>
nmap <silent> <F6> :VersDiff +<cr>
nmap <silent> <F7> :VersDiff -c<cr>


" fugitive 
"---------------------------------------------------------------------------
nnoremap <silent> <Leader>gb :Gblame<CR>	" 現在のソースをgit blame
nnoremap <silent> <Leader>gd :Gdiff<CR>		" 現在のソースの変更点をvimdiffで表示
nnoremap <silent> <Leader>gs :Gstatus<CR>	" 新しい窓を作ってgit statusを表示


" gitv
"---------------------------------------------------------------------------
" http://d.hatena.ne.jp/cohama/20130517/1368806202
autocmd FileType git :setlocal foldlevel=99
" gitv ウィンドウ設定
function! s:gitv_get_current_hash()
  return matchstr(getline('.'), '\[\zs.\{7\}\ze\]$')
endfunction
autocmd FileType git setlocal nofoldenable foldlevel=0
function! s:toggle_git_folding()
  if &filetype ==# 'git'
    setlocal foldenable!
  endif
endfunction
autocmd FileType gitv call s:my_gitv_settings()
function! s:my_gitv_settings()
  " ここに設定を書く
  setlocal iskeyword+=/,-,.
  nnoremap <silent><buffer> C :<C-u>Git checkout <C-r><C-w><CR>
  nnoremap <buffer> <Leader>rb :<C-u>Git rebase <C-r>=GitvGetCurrentHash()<CR><Space>
  nnoremap <buffer> <Leader>R :<C-u>Git revert <C-r>=GitvGetCurrentHash()<CR><CR>
  nnoremap <buffer> <Leader>h :<C-u>Git cherry-pick <C-r>=GitvGetCurrentHash()<CR><CR>
  nnoremap <buffer> <Leader>rh :<C-u>Git reset --hard <C-r>=GitvGetCurrentHash()<CR>
  nnoremap <silent><buffer> t :<C-u>windo call <SID>toggle_git_folding()<CR>1<C-w>w
endfunction


" reanimate.vim
"---------------------------------------------------------------------------
" 保存先のディレクトリ
let g:reanimate_save_dir = "$HOME/.vimdir/save_point"
" デフォルトの保存名
let g:reanimate_default_save_name = "latest"
" sessionoptions
let g:reanimate_sessionoptions="curdir,folds,globals,help,localoptions,slash,tabpages,winsize"
" ステータスラインに現在の保存名を出力
function! Last_point()
    return reanimate#is_saved() ? reanimate#last_point() : "no save"
endfunction
set statusline=%=[%{Last_point()}\]\[%{(&fenc!=''?&fenc:&enc)}/%{&ff}]\[%03l,%03v]

" オートコマンド
augroup SavePoint
    autocmd!
    " 終了時に保存を行う
    autocmd VimLeavePre * ReanimateSave

    " バッファに書き込む時に一緒の保存する
"    autocmd BufWritePost * ReanimateSave
    " CursorHold 時には ReanimateSaveCursorHold を使用する
"     autocmd CursorHold * ReanimateSaveCursorHold
    " 自動的に復元する場合
     autocmd VimEnter * ReanimateLoad
augroup END


" vim-operator-replace
"---------------------------------------------------------------------------
map _  <Plug>(operator-replace)


" vim-over
"---------------------------------------------------------------------------
" http://d.hatena.ne.jp/osyo-manga/20131105/1383664737
let g:clever_f_use_migemo = 1
" over.vimの起動
nnoremap <silent> <Leader>m :OverCommandLine<CR>
" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>


" vim-expand-region
"---------------------------------------------------------------------------
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)



"---------------------------------------------------------------------------
" neobundle.vim
"---------------------------------------------------------------------------
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"自動でリポジトリと同期するプラグイン
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/unite.vim'
NeoBundleLazy 'Shougo/vimfiler', {
\  'autoload' : { 'commands' : [ "VimFilerTab", "VimFiler", "VimFilerExplorer" ] }
\}
NeoBundleLazy 'Shougo/vimshell', {
\  'autoload' : { 'commands' : [ 'VimShell' ] }
\}
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'ujihisa/vimshell-ssh'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'hokaccha/vim-css3-syntax'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'basyura/bitly.vim'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'hokaccha/vim-html5validator'
NeoBundle 'miripiruni/CSScomb-for-Vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'osyo-manga/vim-reanimate'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'
NeoBundle 'osyo-manga/vim-over'
" colorscheme
NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'sjl/badwolf'
NeoBundle 'koron/codic-vim'
NeoBundle 'terryma/vim-expand-region'

"リポジトリを持たないプラグイン
NeoBundleLocal ~/.vim/bundle_manual

" Installation check.
NeoBundleCheck

call neobundle#end()
