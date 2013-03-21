" vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)
"
" Last Change: 09-Mar-2013
" Maintainer:  y.y
"
helptags $VIM/vim73/doc
runtime macros/matchit.vim
"///////////////////////////////////////////////////////////////////////////
"
" vimrc 上書き設定
"
"///////////////////////////////////////////////////////////////////////////
"---------------------------------------------------------------------------
" カラー設定:
"colorscheme zenburn_hibiki
"colorscheme desert

" molokai
let g:molokai_original = 1
colorscheme molokai

" solarized
"syntax enable
"set background=light
"colorscheme solarized

"---------------------------------------------------------------------------
" フォント設定:
if has('win32')
  " Windows用
  set guifont=Consolas:h11:cSHIFTJIS
  "set guifont="Source Code Pro":h11:cSHIFTJIS
  "set guifont=Consolas2:h11:cSHIFTJIS
  "set guifont=meiryo:h12:cSHIFTJIS
  "set guifont=MeiryoKe_Console:h11:cSHIFTJIS
  " 行間隔の設定
  set linespace=1
  " 一部のUCS文字の幅を自動計測して決める
  if has('kaoriya')
    set ambiwidth=auto
  endif
elseif has('mac')
  set guifont=Osaka－等幅:h14
elseif has('xfontset')
  " UNIX用 (xfontsetを使用)
  set guifontset=a14,r14,k14
endif

if has('gui_macvim')
  set showtabline=2    " タブを常に表示
  set transparency=5   " 透明度
  set imdisable        " IME OFF
  set antialias        " アンチエイリアス
  set visualbell t_vb= " ビープ音なし
  " フォント設定
  set guifontwide=Osaka:h14
  set guifont=Osaka-Mono:h18
endif

"---------------------------------------------------------------------------
" ウインドウに関する設定:
"
" コマンドラインの高さ(GUI使用時)
set cmdheight=2

"---------------------------------------------------------------------------
" 日本語入力に関する設定:
"
if has('multi_byte_ime') || has('xim')
  " IME ON時のカーソルの色を設定(設定例:紫)
  highlight CursorIM guibg=Purple guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " XIMの入力開始キーを設定:
    " 下記の s-space はShift+Spaceの意味でkinput2+canna用設定
    "set imactivatekey=s-space
  endif
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
  inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

"---------------------------------------------------------------------------
" その他、見栄えに関する設定:
"
" 検索文字列をハイライトしない(_vimrcではなく_gvimrcで設定する必要がある)
" set nohlsearch
set hlsearch
" gh でハイライト解除 
nnoremap <silent> gh :let @/=''<CR>


"///////////////////////////////////////////////////////////////////////////
"
" 色々追加設定:
"
"///////////////////////////////////////////////////////////////////////////
" ファイルタイププラグインを有効にする
"---------------------------------------------------------------------------
filetype plugin indent on
"syntax enable

" 色々 set 設定
"---------------------------------------------------------------------------
" バックアップファイルを作るディレクトリ
set backupdir=$VIM/dir/backup
" ファイルを上書きする前にバックアップを作る。書き込みが成功してもバックアップはそのまま取っておく。（有効:backup/無効:nobackup）
set nobackup
" ファイルの上書きの前にバックアップを作る。オプション 'backup' がオンでない限り、バックアップは上書きに成功した後削除される。（有効:writebackup/無効:nowritebackup）
set writebackup
" ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
" スワップファイル用のディレクトリ
set directory=$VIM/dir/swap
" viewdir(:mkviewで利用)要のディレクトリ
set viewdir=$VIM/dir/view
" tagsを利用する
set tags=tags
" \ (バックスラッシュ)を / (スラッシュ)に変更
set shellslash
" クリップボードをWindowsと連携
" set clipboard=unnamed
" Vi互換をオフ
set nocompatible
" モード表示
set showmode
" タブ文字、行末など不可視文字を表示する
" タブ文字を CTRL-I で表示し、行末に $ で表示する。（有効:list/無効:nolist）
set list
" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" listで表示される文字のフォーマットを指定する
" Listモード (訳注: オプション 'list' がオンのとき) に使われる文字を設定する。
set listchars=eol:$,tab:>\ ,extends:<
set listchars=tab:.\ ,extends:<
"set listchars=tab:>-,extends:<,trail:-,eol:<
" 行番号を表示する
set number
" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 複数行でもC-Hを有効にする
set backspace=2
" ビジュアルエラーフラッシュとエラービープを無効にする
set visualbell t_vb=
"ステータスラインを常に表示
set laststatus=2
"ステータスラインに文字コードと改行文字を表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" バックスペースでインデントや改行を削除できるようにする 
set backspace=indent,eol,start
" CTRL-A で8進数の計算をさせない
set nrformats-=octal
"カーソル行下線（「set cursorline」がある場合に有効）
set cursorline
"改行記号 etc
hi NonText guibg=NONE guifg=#555555
"hi CursorLine gui=underline guibg=NONE
"set t_Co=256
"hi CursorLine guibg=#222222
" ポップアップメニューのカラーを設定
hi Pmenu guibg=#666666
hi PmenuSel guibg=#8cd0d3 guifg=#666666
hi PmenuSbar guibg=#333333
" perl
"let g:perlpath="C:/strawberry/perl/lib,C:/strawberry/perl/site/lib,C:\strawberry\perl\vendor\lib,."

" 検索関連
"---------------------------------------------------------------------------
" 検索時に大文字小文字を無視
set ignorecase
"検索時に大文字を含んでいたら大/小を区別
set smartcase
" インクリメンタルサーチを行う
set incsearch

" Omni completion
hi Pmenu ctermbg=8
hi PmenuSel ctermbg=12
hi PmenuSbar ctermbg=0

" :grep を :vimgrep のエイリアスにする
" http://bitmap.dyndns.org/blog/archives/001346.html
:set grepprg=internal

" タブ・インデント周り
"---------------------------------------------------------------------------
" 新しい行のインデントを現在行と同じにする
set autoindent
" バッファについてのローカルなオプション。新しい行にインデントを自動挿入する際、既存行のインデント構造をコピーする
set copyindent
" バッファについてのローカルなオプション。現在行のインデント量を調整する際、すでにある部分はインデント構造を保とうとする。勝手にタブとスペースが変換されたりしないように。
set preserveindent
" タブ入力した場合スペースに変換する
"set expandtab
" js ではタブ入力した場合スペースにする
autocmd BufNewFile,BufRead *.js setlocal expandtab 
" タブを入力した場合タブのままにする（スペースにしない）
set noexpandtab
" シフト移動幅
set shiftwidth=4
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=4
" windowを半透明に
"gui
"set transparency=250

" 折りたたみ関係
"---------------------------------------------------------------------------
"set foldtext=FoldCCtext()
"set foldcolumn=5
"set fillchars=vert:\|
"hi Folded gui=bold term=standout ctermbg=DarkGrey ctermfg=DarkBlue guibg=Grey80 guifg=Grey30
"hi FoldColumn gui=bold term=standout ctermbg=DarkGrey ctermfg=DarkBlue guibg=DarkGrey guifg=DarkBlue
noremap <Space>f zf
noremap <Space>d zd
noremap <Space>a za
noremap <Space>j zj
noremap <Space>k zk
noremap <Space>n ]z
noremap <Space>p [z

":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" オートコマンド設定
" ※バッファ読み込みのタイミングなどで実行されるのがオートコマンド(略してau)
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

" *.txt なファイルを編集するときに長い行で勝手に改行が入ってしまう場合に，それを止める方法
autocmd BufRead *.txt set tw=0
" ディレクトリ自動移動 (開いたファイルのディレクトリがカレントディレクトリに)
" http://nanasi.jp/articles/vim/cd_vim.html
"au BufEnter * execute ":lcd " . expand("%:p:h")
" http://espion.just-size.jp/archives/06/034090759.html
"au BufEnter * execute ":lcd " . escape(expand("%:p:h"), " #\\")
" 全ファイルを対象にすると Gist.vim がおかしげになるので、html,shtml,css,js,php,pl,tpl,_gvimrc を対象に
au BufEnter *.html,*.shtml,*.css,*.scss,*.js,*.php,*.pl,*.tpl,.gvimrc execute ":lcd " . expand("%:p:h")
" 入力モード時、ステータスラインのカラーを変更
augroup InsertHook
  autocmd!
  autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
  autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END
" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/
"ウィンドウを最大化して起動
"au GUIEnter * simalt ~x
" 縦幅　デフォルトは24
set lines=40
" 横幅　デフォルトは80
set columns=120
" Vim-users.jp - Hack #120: gVim でウィンドウの位置とサイズを記憶する
" http://vim-users.jp/2010/01/hack120/
let g:save_window_file = expand('~/.vimwinpos')
augroup SaveWindow
  autocmd!
  autocmd VimLeavePre * call s:save_window()
  function! s:save_window()
    let options = [
      \ 'set columns=' . &columns,
      \ 'set lines=' . &lines,
      \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
      \ ]
    call writefile(options, g:save_window_file)
  endfunction
augroup END

if filereadable(g:save_window_file)
  execute 'source' g:save_window_file
endif

"日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0
"タブ幅をリセット
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4

" Hack #84: バッファの表示設定を保存する
" http://vim-users.jp/2009/10/hack84/
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
"autocmd QuickfixCmdPost make,grep,grepadd,vimgrep if len(getqflist()) != 0 | copen | endif

" 'cursorline' を必要な時にだけ有効にする
" http://d.hatena.ne.jp/thinca/20090530/1243615055
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
  autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
  autocmd WinEnter * call s:auto_cursorline('WinEnter')
  autocmd WinLeave * call s:auto_cursorline('WinLeave')

  let s:cursorline_lock = 0
  function! s:auto_cursorline(event)
    if a:event ==# 'WinEnter'
      setlocal cursorline
      let s:cursorline_lock = 2
    elseif a:event ==# 'WinLeave'
      setlocal nocursorline
    elseif a:event ==# 'CursorMoved'
      if s:cursorline_lock
        if 1 < s:cursorline_lock
          let s:cursorline_lock = 1
        else
          setlocal nocursorline
          let s:cursorline_lock = 0
        endif
      endif
    elseif a:event ==# 'CursorHold'
      setlocal cursorline
      let s:cursorline_lock = 1
    endif
  endfunction
augroup END

" Vim の snippet 系プラグインを使う際のTips
" http://d.hatena.ne.jp/thinca/20090526/1243267812
"augroup vimrc-plugin-snipMate
"  autocmd!
"  autocmd VimEnter,BufEnter * call s:snipMate_remap()
"augroup END
"function! s:snipMate_remap()
"  smapclear
"  smapclear <buffer>
"  snoremap <silent> <Tab> <ESC>a<C-r>=TriggerSnippet()<CR>
"endfunction

"相対URLでもgfで開けるように
autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/

":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" キー割当等
"---------------------------------------------------------------------------
" ↓map 系コマンド (再帰的処理あり)
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
" ↓map 系 (再帰的処理あり) と noremap 系 (再帰的処理なし)
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

" 表示行単位で移動するようにする
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Esc を jj に割り当てとく
inoremap jj <Esc>
onoremap jj <Esc>
inoremap j<Space> j
onoremap j<Space> j

" 行頭で h を押すと折畳を閉じる。
nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
" 折畳上で l を押すと折畳を開く。
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'l'
" 行頭で h を押すと選択範囲に含まれる折畳を閉じる。
vnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zcgv' : 'h'
" 折畳上で l を押すと選択範囲に含まれる折畳を開く。
vnoremap <expr> l foldclosed(line('.')) != -1 ? 'zogv0' : 'l'

" 検索結果に移動したとき、その位置を画面の中央に
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" ウィンドウ分割時にウィンドウサイズを調節
nnoremap <silent> <S-Left>  :5wincmd <<CR>
nnoremap <silent> <S-Right> :5wincmd ><CR>
nnoremap <silent> <S-Up>    :5wincmd -<CR>
nnoremap <silent> <S-Down>  :5wincmd +<CR>

" ; で :
"noremap ; :
"noremap : ;
" Ctrl+Bで一文字戻る
map! <C-B> <Left>
" Ctrl+Dでカーソルの下の文字を削除
map! <C-D> <Del>
" Ctrl+Fで一文字進む
"map! <C-F> <Right>
" 挿入モードでクリップボードの内容を貼り付ける
imap <C-k> <ESC>"*pa
" 挿入モードで無名レジスタを貼り付ける
imap <C-p> <ESC>pa
" Ctrl-X Ctrl-Oで補完リストの表示 -> Shift-Spaceで表示
imap <S-Space> <C-X><C-O>
" scroll-smooth
"map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
"map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

" 検索レジスタで検索
"nmap <unique> g/ :exec ':vimgrep /' . getreg('/') . '/j %\|cwin'<CR>
"nmap <unique> G/ :silent exec ':bufdo vimgrepadd /' . getreg('/') . '/j %'<CR>\|:silent cwin<CR>
nmap g/ :exec ':vimgrep /' . getreg('/') . '/j %\|cwin'<CR>
nmap G/ :silent exec ':bufdo vimgrepadd /' . getreg('/') . '/j %'<CR>\|:silent cwin<CR>
" tabをCtrl+tabできりかえ
nmap <C-Tab> gt
nmap <C-S-Tab> gT 
" 先頭と最後に移動を変更
"noremap z $
noremap 0 _
" 行連結でスペースを入れない
noremap J gJ
noremap gJ J

" 日付の入力補完
inoremap <expr> ,df strftime('%Y-%m-%dT%H:%M:%S')
inoremap <expr> ,dd strftime('%Y-%m-%d')
inoremap <expr> ,dt strftime('%H:%M:%S')

" 最後に変更したテキストの選択
nnoremap gc '[v']
vnoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>

" tabでインデント、Shift+tabでアンインデント
inoremap <S-Tab> <C-O><LT><LT>
nnoremap <Tab> >>
nnoremap <S-Tab> <LT><LT>
vnoremap <Tab> >
vnoremap <S-Tab> <LT>

" レジスタ/マークの確認を楽にする
nnoremap <Space>m  :<C-u>marks
nnoremap <Space>r  :<C-u>registers

" /と?の検索を楽にする
"cnoremap <expr> /
"\ getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'

" help を引きやすくする
nnoremap <C-h> :<C-u>help<Space>

" カーソル下のキーワードを help で引けるようにする
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Enter>

" gvimrc の設定環境変数
"let $MYGVIMRC = '$VIM/_gvimrc'
let $MYGVIMRC = '$HOME/dotfiles/.gvimrc'

" gvimrcを即座に開く
nnoremap <Space>.
\        :<C-u>edit $MYGVIMRC<CR>

" gvimrcを即座にリロード
" 専用ホットキーを定義する場合
" <Space>s.でリロード
nnoremap <Space>s.
\        :<C-u>source $MYGVIMRC<CR>

" vimrc の設定環境変数
"let $MYVIMRC = '$VIM/_vimrc'
let $MYVIMRC = '$HOME/dotfiles/.vimrc'

" vimrcを即座に開く
nnoremap <Space>/
\        :<C-u>edit $MYVIMRC<CR>

" 専用Exコマンドを定義する場合
" :ReloadVimrc<Return>でリロード
"command! ReloadVimrc  source $MYVIMRC

" 最後に変更されたテキストを選択する
nnoremap gc  `[v`]

" tab → &#x0009;
"nnoremap <Space>t <S-v>:s/\t/\&#x0009;/g<CR>
"vnoremap <Space>t :s/\t/\&#x0009;/g<CR>

" tab → &nbsp; *4
nnoremap <Space>tt <S-v>:s/\t/\&nbsp;\&nbsp;\&nbsp;\&nbsp;/g<CR>:let @/=''<CR>
vnoremap <Space>tt :s/\t/\&nbsp;\&nbsp;\&nbsp;\&nbsp;/g<CR>:let @/=''<CR>

" html エスケープ
" http://liosk.blog103.fc2.com/blog-entry-187.html
vnoremap <Leader>e "xx:call <SID>EscapeXml('x')<CR>"xP

function! s:EscapeXml(regname)
  let x = getreg(a:regname)
  let x = substitute(x, '&', '\&amp;', 'g')
  let x = substitute(x, '<', '\&lt;', 'g')
  let x = substitute(x, '>', '\&gt;', 'g')
  let x = substitute(x, "'", '\&apos;', 'g')
  let x = substitute(x, '"', '\&quot;', 'g')
  call setreg(a:regname, x)
endfunction

" F1 で作業用バッファ（メモ）を表示
" nmap <F1> :Scratch<CR>

" :w :q
nnoremap <Space>w :<C-u>w<CR>
nnoremap <Space>q :<C-u>q<CR>

" yeでそのカーソル位置にある単語をレジスタに追加
nmap ye :let @"=expand("<cword>")<CR>

" Ctrl+C でクリップボードにコピー
vmap <C-c> "+y

" タブ操作
" tab pagesを使い易くする
"http://whileimautomaton.net/2008/08/vimworkshop3-kana-presentation
nnoremap ,t  <Nop>
nnoremap ,tn  :<C-u>tabnew<CR>
nnoremap ,tc  :<C-u>tabclose<CR>
nnoremap ,to  :<C-u>tabonly<CR>
nnoremap ,tj  :<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>
nnoremap ,tk  gT

" F5: 前のタブ F6: 次のタブ F7: 新規タブ F8: タブを閉じる
"nnoremap <F5> :<C-u>tabprevious<CR>
"nnoremap <F6> :<C-u>tabnext<CR>
"nnoremap <F7> :<C-u>tabnew<CR>
"nnoremap <F8> :<C-u>tabclose<CR>
"
" 隣のタブへ移動
nnoremap L gt
nnoremap H gT

" バッファ操作
" F9: バッファ削除
"nnoremap <F9> :<C-u>bwipe<CR>
nnoremap b  <Nop>
nnoremap bc :<C-u>bwipe<CR>

" tags-and-searchesを使い易くする
"http://whileimautomaton.net/2008/08/vimworkshop3-kana-presentation
nnoremap t  <Nop>
nnoremap tt  <C-]>
nnoremap tj  :<C-u>tag<CR>
nnoremap tk  :<C-u>pop<CR>
nnoremap tl  :<C-u>tags<CR>

"カーソル位置の単語検索
nmap <C-g><C-w> :grep "<C-R><C-W>" *.c *.h *.php *.html *.shtml *.js *.css *.sql<CR>
nmap <C-g><C-a> :grep "<C-R><C-A>" *.c *.h *.php *.html *.shtml *.js *.css *.sql<CR>
nmap <C-g><C-h> :grep "<C-R>/" *.c *.h *.php *.html *.shtml *.js *.css *.sql<CR>
"nmap <C-n> :cn<CR>
"nmap <C-p> :cp<CR>

" ビジュアル選択時(v)に F3 を押すとその文字を検索します。^@ などキー入力が困難なコントロール文字を検索（もしくは置換）対象にするときに重宝
"vmap <F3> y/\V<C-R>=substitute(escape(@",'/'),"\n","\\\\n","g")<CR>/<CR>

" コマンドモードで<C-p>でレジスタペースト
cmap <C-p> <C-r>"

" カーソル下の単語をレジスタで置換
nnoremap <Space>pw cw<C-R>0<Esc>
nnoremap <Space>pi ciw<C-R>0<Esc>

" CSS をソート
" -> ftplugin/css.vim で指定

" Hack #81: Insert mode中で単語単位/行単位の削除をアンドゥ可能にする
" http://vim-users.jp/2009/10/hack81/
inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w>  <C-g>u<C-w>

"<leader>fで現在のファイルをFirefoxで開く
"noremap <Leader>f :silent ! start firefox %<CR>
noremap <Leader>f :silent ! start %<CR>
noremap <Leader>i :silent ! start iexplore %<CR>

"ビジュアルモード時vで行末まで選択
" http://blog.blueblack.net/item_317
vnoremap v $h

" 改行抜きで一行クリップボードにコピー
nnoremap <Space>y 0v$h"+y
nnoremap <C-S-c> 0v$h"+y

" 貼り付け
"nnoremap <C-S-v> "+p

" 置換ダイアログ表示
"nnoremap <Space>f :promptrepl<CR>
nnoremap <Space>l :promptrepl<CR>

" Shift+Enter で <br>
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
inoremap <S-Enter> <br><CR>
nnoremap <S-Enter> a<br><CR><Esc>

" $の入力を楽にする
inoremap <C-d> $

" HTML保存でリロード
" http://mattn.kaoriya.net/software/vim/20100324002419.htm
"function! s:UpdateBrowser()
"  python<<EOM
"import win32gui,win32api,win32con
"hwnd = win32gui.FindWindow("MozillaUIWindowClass", None)
"hwnd = win32gui.FindWindowEx(hwnd, 0, "MozillaWindowClass", None)
"win32gui.SendMessage(hwnd, win32con.WM_KEYDOWN, win32con.VK_F5, 0)
"EOM
"endfunction

"function! s:StartEditing()
"  augroup HtmlEditing
"    au!
"    autocmd BufWritePost,FileWritePost *.html call s:UpdateBrowser()
"  augroup END
"
"  exec "! start " . expand('%:p')
"endfunction

"function! s:StopEditing()
"  augroup HtmlEditing
"    au!
"  augroup END
"endfunction

"command! HtmlStartEditing call s:StartEditing()
"command! HtmlStopEditing call s:StopEditing()

" 「:Utf8」で、ファイルを UTF-8 で開き直す
" http://whileimautomaton.net/2008/08/vimworkshop3-kana-presentation
command! -bang -nargs=? Utf8
\ edit<bang> ++enc=utf-8 <args>


":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" plugin
"   キー割当等、設定
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 
"---------------------------------------------------------------------------
" bufferlist.vim - シンプルで使い易いバッファ一覧表示プラグイン
"---------------------------------------------------------------------------
" エディタのウィンドウの左側にバッファのリストを表示する際のSC設定
"nmap <silent> <F2> :call BufferList()<CR>

"---------------------------------------------------------------------------
" str2htmlentity.vim - vim で HTML文字実体参照の変換を行う
" http://www.serendip.ws/archives/335
"---------------------------------------------------------------------------
vmap <silent> sx :Str2HtmlEntity<cr>
vmap <silent> sr :Entity2HtmlString<cr>

"---------------------------------------------------------------------------
" NERDTree
"---------------------------------------------------------------------------
" ディレクトリとファイルをツリー表示
"nmap <unique> <F3> :NERDTreeToggle<CR>
nnoremap <F1> :NERDTreeToggle<CR>
nnoremap <F2> :NERDTree<CR>

"---------------------------------------------------------------------------
" Trinity
"---------------------------------------------------------------------------
"nnoremap <F1> :TrinityToggleAll<CR>

"---------------------------------------------------------------------------
" neocomplcache
"---------------------------------------------------------------------------
" Use neocomplcache.
" -> _vimrcに設定 ( <Space>/ )
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

"---------------------------------------------------------------------------
" unite.vim
"---------------------------------------------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=1
" history/yankの有効化 -> vimrc に指定

" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
"nnoremap <silent> <C-p> :<C-u>Unite buffer<CR>
" ファイル一覧 - file_current_dir
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" ファイル一覧 - current_dir（再帰的、プレビュー付き）
nnoremap <silent> ,up :<C-u>Unite file_rec -auto-preview<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
"nnoremap <silent> <C-n> :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" yank
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> <Space>y :<C-u>Unite history/yank<CR>

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

"---------------------------------------------------------------------------
" vim-ref
"---------------------------------------------------------------------------
let $PATH = $PATH . ';' . 'C:\Program Files (x86)\Lynx for Win32\'
"let g:ref_alc_encoding = 'Shift-JIS'
"
"let g:ref_alc_cmd = 'lynx -dump -nonumbers %s'
"let g:ref_alc_use_cache = 1
"let g:ref_alc_start_linenumber = 33 " 余計な行を読み飛ばす
"let g:ref_alc_encoding = 'UTF-8'    " イマイチよく分かってない
"let g:ref_cache_dir = $VIM . '\dir\alccache'   " ローカルにキャッシュ
"if exists('*ref#register_detection')
"	" filetypeが分からんならalc
"	call ref#register_detection('_', 'alc')
"endif

" lynx.exe の絶対パス
let s:lynx = 'C:\usr\local\Lynx\bin\lynx.exe'
" lynx.cfg の絶対パス
let s:cfg  = 'C:\usr\local\Lynx\bin\lynx.cfg'
let g:ref_alc_cmd = s:lynx.' -cfg='.s:cfg.' -dump %s'

"nnoremap <Space>a :Ref alc 

let $JQUERY = $VIM . '\plugins\thinca-vim-ref-110d45d\myDownload\jqapi-latest\docs'
let g:ref_jquery_path = $JQUERY

"---------------------------------------------------------------------------
" 選択範囲を数値文字参照に変換するスクリプト str2numchar.vim
" http://d.hatena.ne.jp/secondlife/20060902/1157137092
"---------------------------------------------------------------------------
" 文字コードを知りたいだけだったら、文字にカーソルをあわせて ga を押す
vmap <silent> sn :Str2NumChar<CR> 
vmap <silent> sh :Str2HexLiteral<CR> 

"---------------------------------------------------------------------------
" 選択範囲を文字参照に変換
" http://hail2u.net/blog/software/vim-settings-for-web-development.html
"---------------------------------------------------------------------------
" ビジュアルモードで範囲選択→「:」で:'<,'>まで補完されコマンドモード→「EncodeEntities」エンターで
" command! -range EncodeEntities :'<,'>!perl -S encode-entities.pl

"---------------------------------------------------------------------------
" project.vim
"---------------------------------------------------------------------------
" project.vimをトグルで使う
" http://unsigned.g.hatena.ne.jp/Trapezoid/20070417/p2
"function! ToggleProjectWindow()
"	if exists("s:projectstate")
"		unlet s:projectstate
"		return ":close"
"	else
"		let s:projectstate = 1
"		return ""
"	endif
"endfunction
"map <silent> <F12> <esc>:Project<cr>:execute ToggleProjectWindow()<cr>
nmap <silent> <F12> <Plug>ToggleProject

"---------------------------------------------------------------------------
" YR用（ヤンクリング yankring
"---------------------------------------------------------------------------
" function! YRRunAfterMaps()
"   nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
" endfunction
" 
" let mapleader = ','
" nnoremap <silent> <F11> :YRShow<CR>
" nnoremap <silent> <Leader>yr :YRGetElem<CR>

"---------------------------------------------------------------------------
" yanktmp.vim
"---------------------------------------------------------------------------
"let g:yanktmp_file = $VIM.'/tmp/vimyanktmp'
"map <silent> sy :call YanktmpYank()<CR>
"map <silent> sp :call YanktmpPaste_p()<CR>
"map <silent> sP :call YanktmpPaste_P()<CR> 

"---------------------------------------------------------------------------
" taglist.vim: JavaScriptの表示対象を変更
"---------------------------------------------------------------------------
let g:tlist_javascript_settings = 'javascript;c:class;m:method;f:function'
let Tlist_Show_One_File = 1               "現在編集中のソースのタグしか表示しない 
let Tlist_Exit_OnlyWindow = 1             "taglistのウィンドーが最後のウィンドーならばVimを閉じる 
let Tlist_Use_Right_Window = 1            "右側でtaglistのウィンドーを表示 
nnoremap <silent> <F5> :Tlist<CR>

"---------------------------------------------------------------------------
" surround.vim
"---------------------------------------------------------------------------
nmap s <Plug>Ysurround
nmap ss <Plug>Yssurround
" vim でアスキーコードを調べるには、調べたい文字の上にカーソルをあわせて :ascii と押す
" [key map]
" 1 : <h1>|</h1>
" 2 : <h2>|</h2>
" 3 : <h3>|</h3>
" 4 : <h4>|</h4>
" 5 : <h5>|</h5>
" 6 : <h6>|</h6>
"
" p : <p>|</p>
" u : <ul>|</ul>
" o : <ol>|</ol>
" l : <li>|</li>
" a : <a href="">|</a>
" A : <a href="|"></a>
" i : <img src="|" alt="" />
" I : <img src="" alt"|" />
" d : <div>|</div>
" D : <div class="section">|</div>
augroup SurrondHtmlCommand
  autocmd FileType html let g:surround_49  = "<h1>\r</h1>"
  autocmd FileType html let g:surround_50  = "<h2>\r</h2>"
  autocmd FileType html let g:surround_51  = "<h3>\r</h3>"
  autocmd FileType html let g:surround_52  = "<h4>\r</h4>"
  autocmd FileType html let g:surround_53  = "<h5>\r</h5>"
  autocmd FileType html let g:surround_54  = "<h6>\r</h6>"
  autocmd FileType html let g:surround_112 = "<p>\r</p>"
  autocmd FileType html let g:surround_117 = "<ul>\r</ul>"
  autocmd FileType html let g:surround_111 = "<ol>\r</ol>"
  autocmd FileType html let g:surround_108 = "<li>\r</li>"
  autocmd FileType html let g:surround_97  = "<a href=\"#\">\r</a>"
  autocmd FileType html let g:surround_65  = "<a href=\"\r\"></a>"
  autocmd FileType html let g:surround_105 = "<img src=\"\r\" alt=\"\" />"
  autocmd FileType html let g:surround_73  = "<img src=\"\" alt=\"\r\" />"
  autocmd FileType html let g:surround_100 = "<div>\r</div>"
  autocmd FileType html let g:surround_68  = "<div class=\"section\">\r</div>"

  autocmd FileType xhtml let g:surround_49  = "<h1>\r</h1>"
  autocmd FileType xhtml let g:surround_50  = "<h2>\r</h2>"
  autocmd FileType xhtml let g:surround_51  = "<h3>\r</h3>"
  autocmd FileType xhtml let g:surround_52  = "<h4>\r</h4>"
  autocmd FileType xhtml let g:surround_53  = "<h5>\r</h5>"
  autocmd FileType xhtml let g:surround_54  = "<h6>\r</h6>"
  autocmd FileType xhtml let g:surround_112 = "<p>\r</p>"
  autocmd FileType xhtml let g:surround_117 = "<ul>\r</ul>"
  autocmd FileType xhtml let g:surround_111 = "<ol>\r</ol>"
  autocmd FileType xhtml let g:surround_108 = "<li>\r</li>"
  autocmd FileType xhtml let g:surround_97  = "<a href=\"#\">\r</a>"
  autocmd FileType xhtml let g:surround_65  = "<a href=\"\r\"></a>"
  autocmd FileType xhtml let g:surround_105 = "<img src=\"\r\" alt=\"\" />"
  autocmd FileType xhtml let g:surround_73  = "<img src=\"\" alt=\"\r\" />"
  autocmd FileType xhtml let g:surround_100 = "<div>\r</div>"
  autocmd FileType xhtml let g:surround_68  = "<div class=\"section\">\r</div>"
augroup END

"---------------------------------------------------------------------------
" smartchr
"---------------------------------------------------------------------------
"inoremap <expr> = smartchr#loop(' = ', ' == ', '=')
autocmd FileType css inoremap <expr> : smartchr#loop(': ', ':')
"autocmd FileType php inoremap <expr> = smartchr#one_of(' = ', ' == ', ' === ', '=')
"autocmd FileType javascript inoremap <expr> = smartchr#one_of(' = ', ' == ', ' === ', '=')
autocmd FileType xhtml inoremap <expr> = smartchr#one_of('=""', '=')
inoremap <expr> " smartchr#one_of('"', '""', "'", "''")

"---------------------------------------------------------------------------
" Gist
"---------------------------------------------------------------------------
let $PATH = $PATH . ';' . 'C:\Program Files (x86)\Git\bin\'
let g:gist_detect_filetype = 1
nnoremap <Space>gn :Gist<CR>
nnoremap <Space>gl :Gist -l<CR>
nnoremap <Space>ga :Gist -a<CR>
nnoremap <Space>ge :Gist -e<CR>
nnoremap <Space>gp :Gist -p<CR>
nnoremap <Space>gr :Gist
nnoremap <Space>gu :Gist -l

"---------------------------------------------------------------------------
" Zencoding.vim
"---------------------------------------------------------------------------
" -> _vimrc に設定 ( <Space>/ )

"---------------------------------------------------------------------------
" endtagcomment.vim 閉じタグ用
"---------------------------------------------------------------------------
" let g:endtagcommentFormat = '<!-- /%tag_name%id%class -->'
let g:endtagcommentFormat = '<!-- / %id%class -->'
" http://twitter.com/#!/kosei27/status/10625078672756736
" class名変えたりしたときは、既存のコメント消した後で追加
nnoremap <Space>, :<C-u>call Endtagcomment()<CR>
nnoremap <Space>,t ^df> :<C-u>call Endtagcomment()<CR>
inoremap <Space>, <Esc>:<C-u>call Endtagcomment()<CR>

"---------------------------------------------------------------------------
" srcexpl.vim - 今使っていない
"---------------------------------------------------------------------------
"自動でプレビューを表示する。TODO:うざくなってきたら手動にする。またはソースを追う時だけ自動に変更する。
"let g:SrcExpl_RefreshTime   = 1
"プレビューウインドウの高さ
let g:SrcExpl_WinHeight     = 9
"tagsは自動で作成する
let g:SrcExpl_UpdateTags    = 1
"マッピング
let g:SrcExpl_RefreshMapKey = "<Space>"
let g:SrcExpl_GoBackMapKey  = "<C-b>"
"nmap <F8> :SrcExplToggle<CR>

"---------------------------------------------------------------------------
" vimfiler
"---------------------------------------------------------------------------
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1
" vimfiler をサクサク起動する
nnoremap <S-Space>f :<C-u>VimFiler<CR>

"---------------------------------------------------------------------------
" showmarks
"---------------------------------------------------------------------------
let g:showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

"---------------------------------------------------------------------------
" toggle.vim
"---------------------------------------------------------------------------
imap <C-T> <Plug>ToggleI
nmap <C-T> <Plug>ToggleN
vmap <C-T> <Plug>ToggleV

""---------------------------------------------------------------------------
"" TweetVim.vim
""---------------------------------------------------------------------------
"" タイムライン選択用の Unite を起動する
"nnoremap <silent> <C-t> :Unite tweetvim<CR>
"" 発言用バッファを表示する
"nnoremap <silent> say           :<C-u>TweetVimSay<CR>
"" mentions を表示する
"nnoremap <silent> <Space>re   :<C-u>TweetVimMentions<CR>
"" 特定のリストのタイムラインを表示する
"nnoremap <silent> <Space>tt   :<C-u>TweetVimListStatuses friends<CR>
"
"" スクリーン名のキャッシュを利用して、neocomplcache で補完する
"if !exists('g:neocomplcache_dictionary_filetype_lists')
"  let g:neocomplcache_dictionary_filetype_lists = {}
"endif
"let neco_dic = g:neocomplcache_dictionary_filetype_lists
"let neco_dic.tweetvim_say = $HOME . '/.tweetvim/screen_name'
"" アイコン表示（ImageMagickが必要）
""let g:tweetvim_display_icon = 1

"---------------------------------------------------------------------------
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

"---------------------------------------------------------------------------
" kaoriya パッチ
"---------------------------------------------------------------------------
" スクラッチバッファを開く
nnoremap <F8> :Scratch<CR>

"---------------------------------------------------------------------------
" memolist.vim
"---------------------------------------------------------------------------
let g:memolist_path = "D:/EvernoteTest"
let g:memolist_memo_suffix = "txt"

"---------------------------------------------------------------------------
" sass-compile.vim
"---------------------------------------------------------------------------
" 編集したファイルから遡るフォルダの最大数
let g:sass_compile_cdloop = 5

" ファイル保存時に自動コンパイル（1で自動実行）
let g:sass_compile_auto = 1

" 自動コンパイルを実行する拡張子
let g:sass_compile_file = ['scss', 'sass']

" cssファイルが入っているディレクトリ名（前のディレクトリほど優先）
let g:sass_compile_cssdir = ['css', 'stylesheet']

let g:sass_compile_beforecmd = ""

"---------------------------------------------------------------------------
" CSSComb
"---------------------------------------------------------------------------
vnoremap <Space>c :CSScomb<CR>

":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"
" 文字コードの自動認識用
" http://www.kawaz.jp/pukiwiki/?vim#cb691f26
"
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif


" 略語 snipMate を利用時は使用不可能
"---------------------------------------------------------------------------
"ab #b /* ---------------------------------------
"ab #e ---------------------------------------- */

