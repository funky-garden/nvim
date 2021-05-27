" LINE NUMBERING
set number
set relativenumber
set rnu


" TAB SETTINGS
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set mouse=a

" Turn off search highlighting
set nohlsearch
set incsearch

" Keep buffers open like all the time
set hidden

" Dont wrap text


" History/Undo
set noswapfile
set nobackup


" Scroll when 8 away from bottom
set scrolloff=8
set signcolumn=yes

" Set term gui colors
set termguicolors
" thick boi curosr always
set guicursor=

colorscheme onedark

set pumheight=10


" buffer movement remaps
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <leader>c :bd<CR>
nnoremap <C-h> :lnext <CR>
nnoremap <C-l> :lprev <CR>

nnoremap  <C-n> : bprev <CR>


nnoremap <leader>m :MaximizerToggle<CR>

