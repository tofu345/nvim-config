set nocompatible

set nowrap
set incsearch
set ignorecase

set noautoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set number
set rnu
set signcolumn=yes
set showcmd
set showmode

set hidden
set scrolloff=4

nnoremap <Space>pf <Cmd>Files<CR>
nnoremap <Space>ps <Cmd>Rg<CR>
nnoremap <C-p> <Cmd>GFiles<CR>
nnoremap <Space>l <Cmd>Buffers<CR>
tnoremap <Esc> <C-\><C-n>

" remove all trailing whitespace 
execute "set <M-f>=\ef"
nnoremap <silent> <M-f> :%s/\s\+$//e<CR>

let g:dirvish_mode='sort ,^.*[\/],' " netrw like
let g:dirvish_relative_paths = 0

call plug#begin()

" Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-eunuch'

call plug#end()

colorscheme jellybeans

" transparent background
hi Normal guibg=NONE ctermbg=NONE
hi NonText ctermbg=NONE guibg=NONE
hi LineNr ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
