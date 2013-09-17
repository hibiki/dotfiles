" vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)
"
" An example for a Japanese version vimrc file.
" 日本語版のデフォルト設定ファイル(vimrc) - Vim7用試作
"
" Last Change: 16-Jun-2013.
" Maintainer:  y.y
"
"---------------------------------------------------------------------------
" gist
"---------------------------------------------------------------------------
let g:github_user = 'hibiki'

"---------------------------------------------------------------------------
" Zencoding.vim
"---------------------------------------------------------------------------
au BufRead,BufNewFile *.scss set filetype=scss
"let g:user_zen_expandabbr_key = "<C-t>"
let g:user_zen_expandabbr_key = "<C-e>"
"let g:user_zen_togglecomment_key = "<C-e>/"
let g:use_zen_complete_tag = 1
" zen-coding の設定
let g:user_zen_settings = {
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

"---------------------------------------------------------------------------
" neocomplcache.vim
"---------------------------------------------------------------------------
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

"---------------------------------------------------------------------------
" unite.vim
"---------------------------------------------------------------------------
let g:unite_source_history_yank_enable = 1  "history/yankの有効化

"---------------------------------------------------------------------------
" proc
"---------------------------------------------------------------------------
if has('mac')
"let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/vimproc_mac.so'
elseif has('win64')
let g:vimproc_dll_path = $HOME . '\.vim\autoload\vimproc_win64.dll'
endif

"---------------------------------------------------------------------------
" easymotion.vim: 
"---------------------------------------------------------------------------
let g:EasyMotion_leader_key = ','

"---------------------------------------------------------------------------
" neobundle.vim
"---------------------------------------------------------------------------
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
"  set runtimepath+=d:/tool/vim/.bundle/neobundle.vim
"  call neobundle#rc(expand('d:/tool/vim/.bundle'))
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

"自動でリポジトリと同期するプラグイン
NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundleLazy 'Shougo/vimfiler', {
\   'autoload' : { 'commands' : [ "VimFilerTab", "VimFiler", "VimFilerExplorer" ] }
\}
NeoBundleLazy 'Shougo/vimshell', {
\   'autoload' : { 'commands' : [ 'VimShell' ] }
\}
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/vimshell-ssh'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'hokaccha/vim-css3-syntax'
NeoBundle 'othree/eregex.vim'
"NeoBundle 'git://gist.github.com/411828.git', {'directory': 'endtagcomment/plugin'} 手動で管理のほうに
"NeoBundle 'cakebaker/scss-syntax.vim.git'//なくてよさそう
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'basyura/twibill.vim'
"NeoBundle 'basyura/TweetVim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'basyura/bitly.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'hokaccha/vim-html5validator'
NeoBundle 'miripiruni/CSScomb-for-Vim'
NeoBundle 'Lokaltog/vim-powerline.git'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'osyo-manga/vim-reanimate'

"リポジトリを持たないプラグイン
"NeoBundle 'monday', {'type' : 'nosync', 'base' : '~/.bundle_manual'}
"NeoBundle 'colorscheme', {'type' : 'nosync', 'base' : '~/.bundle_manual'}
NeoBundleLocal ~/.vim/bundle_manual

filetype plugin on
filetype indent on
" Installation check.
NeoBundleCheck


