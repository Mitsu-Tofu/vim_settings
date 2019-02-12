" --------------------------------
" 基本設定
" --------------------------------
" vim内部で使われる文字エンコーディングをutf-8に設定する
set encoding=utf-8

" 想定される改行コードの指定する
set fileformats=unix,dos,mac

" ハイライトを有効化する
syntax enable

" 挿入モードでTABを挿入するとき、代わりに適切な数の空白を使う
set expandtab

" 新しい行を開始したとき、新しい行のインデントを現在行と同じにする
set autoindent
" 行番号を見れる
set number
" clipboardを共有
set clipboard+=unnamed,autoselect

filetype plugin indent on

if !&compatible
  set nocompatible
endif

"dein setting 
"dein installed automatically
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:dein_dir . '/plugins.toml', {'lasy':0})
  call dein#load_toml(s:dein_dir . '/lasy.toml', {'lasy':1})

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

" install not installed plugins on start up
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

" pangloss/vim-javascript settings
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

augroup javascript_library
        autocmd!
augroup END

"'othree/javascript-libraries-syntax.vim'
function! EnableJavascript()
        " setup used libraries
        let g:used_javascript_libs = 'jquery,underscore,react,flux,jasmine,d3,vue'
        let b:javascript_lib_use_jquery = 1
        let b:javascript_lib_use_underscore = 1
        let b:javascript_lib_use_react = 1
        let b:javascript_lib_use_vue = 1
        let b:javascript_lib_use_flux = 1
        let b:javascript_lib_use_jasmine = 1
        let b:javascript_lib_use_d3 = 1
endfunction
autocmd javascript_library FileType javascript,javascript.jsx call EnableJavascript()

