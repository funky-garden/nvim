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
"" <C-L> clears the serach highlight
if maparg('<C-Y>', 'n') ==# ''
    nnoremap <C-y> : let @/ = ""<CR>
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
nnoremap <C-j> :lua vim.diagnostic.goto_next()<CR>
nnoremap <C-k> :lua vim.diagnostic.goto_prev()<CR>
nnoremap <leader>c :bd<CR>
nnoremap <C-h> :cnext<CR>
nnoremap <C-l> :cprev <CR>
nnoremap <leader>a :A<CR>

nnoremap   <C-b> : bprev <CR>
nnoremap  <C-n> : bnext <CR>
" close all buffers but current one
nnoremap <leader>o : %bd\|e# <CR>


nnoremap <leader>m :MaximizerToggle<CR>
nnoremap <leader>e :Ranger<CR>

nnoremap <C-p>       <cmd>Telescope find_files<cr>
nnoremap <leader>km  <cmd>Telescope keymaps<cr>
nnoremap <leader>b   <cmd>Telescope buffers<cr>
nnoremap <leader>g   <cmd>Telescope live_grep<cr>
nnoremap <leader>l   <cmd>Telescope git_commits<cr>
nnoremap <leader>r   <cmd>Telescope git_branches<cr>
nnoremap <leader>u   <cmd>Telescope undo<cr>
nnoremap <leader>gs  <cmd>Telescope git_status<cr>
nnoremap <leader>vrr <cmd>Telescope lsp_references<cr>
nnoremap <leader>vd  <cmd>Telescope lsp_definitions<cr>
nnoremap <leader>vi  <cmd>Telescope lsp_implementations<cr>
nnoremap <leader>vn  <cmd>Telescope diagnostics<cr>

nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>h :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>

