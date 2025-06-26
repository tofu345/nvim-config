nnoremap <Space>pv <Cmd>Ex<CR>

" execute "set <M-,>=\e,"
" nnoremap <M-,> <Cmd>bp<CR>
" execute "set <M-.>=\e."
" nnoremap <M-.> <Cmd>bn<CR>
" execute "set <M-c>=\ec"
" nnoremap <M-c> <Cmd>bd<CR>

nnoremap <Space>pf <Cmd>Files<CR>
nnoremap <Space>ps <Cmd>Ag<CR>
nnoremap <C-p> <Cmd>GFiles<CR>
nnoremap <Space><Space> <Cmd>Buffers<CR>
" nnoremap <Space>ps <Cmd>Commands<CR>

" nnoremap <Space>u <Cmd>UndotreeToggle<CR>

" remove all trailing whitespace https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
execute "set <M-f>=\ef"
nnoremap <silent> <M-f> :%s/\s\+$//e<CR>

" nnoremap <C-a> gg"+yG

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap n nzzzv
nnoremap N Nzzzv

imap <Tab> <Space><Space><Space><Space>

let g:netrw_fastbrowse = 0

filetype plugin indent on
set nowrap
set incsearch

set noautoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set number
set rnu
set hidden
set nocompatible
set ignorecase
set showcmd
set showmode
let g:netrw_banner = 0 " Hide netrw top bar, toggle with 'I'
let g:netrw_altfile = 1
" set laststatus=2 " show status line

call plug#begin()

Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

colorscheme jellybeans

" transparent background
hi Normal guibg=NONE ctermbg=NONE
hi NonText ctermbg=NONE guibg=NONE
hi LineNr ctermbg=NONE guibg=NONE
