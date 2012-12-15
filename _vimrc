" vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)
"
" An example for a Japanese version vimrc file.
" 日本語版のデフォルト設定ファイル(vimrc) - Vim7用試作
"
" Last Change: 15-Dec-2012.
" Maintainer:  y.y.
"
"---------------------------------------------------------------------------
" gist
"---------------------------------------------------------------------------
let g:github_user = 'hibiki'

"---------------------------------------------------------------------------
" Zencoding.vim
"---------------------------------------------------------------------------
"let g:user_zen_expandabbr_key = "<C-t>"
let g:user_zen_expandabbr_key = "<C-e>"
let g:use_zen_complete_tag = 1

"---------------------------------------------------------------------------
" neocomplcache.vim
"---------------------------------------------------------------------------
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

"---------------------------------------------------------------------------
" unite.vim
"---------------------------------------------------------------------------
let g:unite_source_history_yank_enable =1  "history/yankの有効化

"---------------------------------------------------------------------------
" neobundle.vim
"---------------------------------------------------------------------------
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
"  set runtimepath+=d:/tool/vim/.bundle/neobundle.vim
"  call neobundle#rc(expand('d:/tool/vim/.bundle'))
  set runtimepath+=~/.bundle/neobundle.vim
  call neobundle#rc(expand('~/.bundle'))
endif

"自動でリポジトリと同期するプラグイン
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'git://github.com/tpope/vim-repeat.git'
NeoBundle 'git://github.com/ujihisa/unite-colorscheme.git'
NeoBundle 'git://github.com/ujihisa/vimshell-ssh.git'
NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'
NeoBundle 'git://github.com/vim-jp/vimdoc-ja.git'
NeoBundle 'git://github.com/kana/vim-smartchr.git'
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/mattn/gist-vim.git'
NeoBundle 'git://github.com/mattn/webapi-vim.git'
NeoBundle 'git://github.com/Lokaltog/vim-easymotion.git'
NeoBundle 'git://github.com/hail2u/vim-css3-syntax.git'
NeoBundle 'git://github.com/othree/eregex.vim.git'
NeoBundle 'git://gist.github.com/411828.git', {'directory': 'endtagcomment'}
NeoBundle 'git://github.com/cakebaker/scss-syntax.vim.git'
NeoBundle 'git://github.com/jpo/vim-railscasts-theme.git'
NeoBundle 'git://github.com/scrooloose/nerdtree.git'
NeoBundle 'git://github.com/tyru/open-browser.vim.git'
NeoBundle 'git://github.com/basyura/twibill.vim.git'
"NeoBundle 'git://github.com/basyura/TweetVim.git'
NeoBundle 'git://github.com/h1mesuke/unite-outline.git'
NeoBundle 'git://github.com/basyura/bitly.vim.git'

"リポジトリを持たないプラグイン
"NeoBundle 'monday', {'type' : 'nosync', 'base' : '~/.bundle_manual'}
"NeoBundle 'ShowMarks', {'type' : 'nosync', 'base' : '~/.bundle_manual'}
"NeoBundle 'commentout', {'type' : 'nosync', 'base' : '~/.bundle_manual'}
"NeoBundle 'colorscheme', {'type' : 'nosync', 'base' : '~/.bundle_manual'}
NeoBundleLocal ~/.bundle_manual

filetype plugin on
filetype indent on

"---------------------------------------------------------------------------
" easymotion.vim: 
"---------------------------------------------------------------------------
let g:EasyMotion_leader_key = ','


