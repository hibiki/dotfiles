" 表示
"---------------------------------------------------------------------------

" カラー設定
let g:molokai_original = 1
"colorscheme molokai
colorscheme slate

" フォント
if has('win32')
    " When VL Gothic isn't found in the system, use MS Gothic.
    set guifont=Consolas:h11:cSHIFTJIS,VL_Gothic:h12:cSHIFTJIS,MS_Gothic:h12:cSHIFTJIS
    set linespace=0
elseif has('mac')
    set guifont=VL_Gothic:h16
    set linespace=0
endif


" その他
"---------------------------------------------------------------------------

" Vim-users.jp - Hack #120: gVim でウィンドウの位置とサイズを記憶する
" http://vim-jp.org/vim-users-jp/2010/01/28/Hack-120.html
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






" 
"---------------------------------------------------------------------------



