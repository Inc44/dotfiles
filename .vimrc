set clipboard=unnamedplus
set encoding=utf-8
set laststatus=2
set nocompatible
set noswapfile
set number
set relativenumber
set spell spelllang=en_us,fr,ru
set wrap
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
" ## added by OPAM user-setup for vim / base ## d611dd144a5764d46fdea4c0c2e0ba07 ## you can edit, but keep this line
let s:opam_share_dir = system("opam var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_available_tools = []
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if isdirectory(s:opam_share_dir . "/" . tool)
    call add(s:opam_available_tools, tool)
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
