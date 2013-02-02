" vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)
"
" An example for a Japanese version vimrc file.
" 日本語版のデフォルト設定ファイル(vimrc) - Vim7用試作
"
" Last Change: 03-Feb-2013.
" Maintainer:  y.y
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
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

"自動でリポジトリと同期するプラグイン
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neobundle.vim.git'
NeoBundle 'Shougo/vimproc.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vimfiler.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'tpope/vim-repeat.git'
NeoBundle 'ujihisa/unite-colorscheme.git'
NeoBundle 'ujihisa/vimshell-ssh.git'
NeoBundle 'altercation/vim-colors-solarized.git'
NeoBundle 'vim-jp/vimdoc-ja.git'
NeoBundle 'kana/vim-smartchr.git'
NeoBundle 'mattn/zencoding-vim.git'
NeoBundle 'mattn/gist-vim.git'
NeoBundle 'mattn/webapi-vim.git'
NeoBundle 'Lokaltog/vim-easymotion.git'
NeoBundle 'hail2u/vim-css3-syntax.git'
NeoBundle 'othree/eregex.vim.git'
NeoBundle 'git://gist.github.com/411828.git', {'directory': 'endtagcomment/plugin'}
NeoBundle 'cakebaker/scss-syntax.vim.git'
NeoBundle 'jpo/vim-railscasts-theme.git'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'tyru/open-browser.vim.git'
NeoBundle 'basyura/twibill.vim.git'
"NeoBundle 'basyura/TweetVim.git'
NeoBundle 'h1mesuke/unite-outline.git'
NeoBundle 'basyura/bitly.vim.git'
NeoBundle 'tomasr/molokai.git'
NeoBundle 'glidenote/memolist.vim'
"NeoBundle 'AtsushiM/sass-compile.vim.git' windowsでtempがどうも上手く作れてない？
NeoBundle 'rhysd/clever-f.vim.git'

"リポジトリを持たないプラグイン
"NeoBundle 'monday', {'type' : 'nosync', 'base' : '~/.bundle_manual'}
"NeoBundle 'ShowMarks', {'type' : 'nosync', 'base' : '~/.bundle_manual'}
"NeoBundle 'commentout', {'type' : 'nosync', 'base' : '~/.bundle_manual'}
"NeoBundle 'colorscheme', {'type' : 'nosync', 'base' : '~/.bundle_manual'}
NeoBundleLocal ~/.vim/bundle_manual

filetype plugin on
filetype indent on

"---------------------------------------------------------------------------
" easymotion.vim: 
"---------------------------------------------------------------------------
let g:EasyMotion_leader_key = ','


