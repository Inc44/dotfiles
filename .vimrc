set clipboard=unnamedplus
set encoding=utf-8
set laststatus=2
set nocompatible
set noswapfile
set number
set relativenumber
set spell
set wrap
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>