
syntax enable;
colorscheme desert

set expandtab
set ts=4
set sw=4
set number
set hlsearch

set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim

  call neobundle#begin(expand('~/.bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif

NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'git://github.com/Shougo/vim-vcs.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/OrangeT/vim-csharp.git'
NeoBundle 'git://github.com/jeroenbourgois/vim-actionscript.git'

filetype plugin on
filetype indent on

let g:unite_enable_start_insert=1
nmap <C-p> :Unite buffer<CR>
nmap <C-n> :UniteWithBufferDir -buffer-name=files file<CR>
nmap <C-z> :Unite file_mru<CR>
nmap <C-@> :Unite -buffer-name=registerr register<CR>

nmap <F5> :!perl %<CR>

