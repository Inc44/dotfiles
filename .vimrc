set number
set laststatus=2
set nocompatible
set wrap
set encoding=utf-8
set clipboard=unnamedplus
set spell
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif
