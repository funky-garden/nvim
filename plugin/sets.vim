" LINE NUMBERING
set number
set relativenumber
set rnu

" TAB SETTINGS
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

"let the mouse work
set mouse=a

" Turn off search highlighting
set nohlsearch
set incsearch

" Keep buffers open like all the time
set hidden

" History/Undo
set noswapfile
set nobackup

"search
set ignorecase
set incsearch
set hlsearch
set wildmenu
"" <C-L> clears the serach highlight
if maparg('<C-L>', 'n') ==# ''
    nnoremap <C-l> : let @/ = ""<CR>
endif

" Scroll when 8 away from bottom
set scrolloff=8
set signcolumn=yes

" " Set term gui colors
" set termguicolors
" thick boi curosr always
set guicursor=
set pumheight=10
let g:ranger_replace_netrw = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']


" quickfix list and local list movements
nnoremap <C-j> :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <C-k> :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <leader>c :bd<CR>
nnoremap <C-h> :cprev <CR>

nnoremap   <C-b> : bprev <CR>
nnoremap  <C-n> : bnext <CR>
" close all buffers but current one
nnoremap <leader>o : %bd\|e# <CR>


nnoremap <leader>m :MaximizerToggle<CR>
nnoremap <leader>e :Ranger<CR>


nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>h :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>

