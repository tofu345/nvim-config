nnoremap <Space>pv <Cmd>Ex<CR>
nnoremap <Space>pf <Cmd>Files<CR>
nnoremap <Space>ps <Cmd>Rg<CR>
nnoremap <C-p> <Cmd>GFiles<CR>
nnoremap <Space>l <Cmd>Buffers<CR>

nnoremap <Space>u <Cmd>UndotreeToggle<CR>

" remove all trailing whitespace 
" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
execute "set <M-f>=\ef"
nnoremap <silent> <M-f> :%s/\s\+$//e<CR>

set nowrap
set incsearch

set noautoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set scrolloff=8
set number
set rnu
set hidden
set nocompatible
set ignorecase
set showcmd
set showmode

let g:netrw_banner = 0
let g:netrw_altfile = 1
let g:netrw_fastbrowse = 0

call plug#begin()

Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'mbbill/undotree'

call plug#end()

colorscheme jellybeans

" transparent background
hi Normal guibg=NONE ctermbg=NONE
hi NonText ctermbg=NONE guibg=NONE
hi LineNr ctermbg=NONE guibg=NONE

if has("persistent_undo")
   let target_path = expand('~/.undodir-vim')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif
