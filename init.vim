"Welcome to Benny's NeoVim config :-)
"

" HELP
"
" To see what an option is run :h {config}
" Run :options to see a list of all options

packadd termdebug
call plug#begin('~/.vim/plugged')
" Plugins
" Lsp
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'

" Linter
Plug 'dense-analysis/ale'

" tree sitter {highlighting}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Lua stuffz ???
Plug 'ray-x/lsp_signature.nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'tjdevries/nlua.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

" status bar
Plug 'vim-airline/vim-airline'

" Comments
Plug 'tpope/vim-commentary'
Plug 'othree/jsdoc-syntax.vim'

" Maximzer
Plug 'szw/vim-maximizer'

" git
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'

Plug 'airblade/vim-gitgutter'

" Fuzzy Find
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'tversteeg/registers.nvim'

" Ranger
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

"A vim
Plug 'vim-scripts/a.vim'

"Themes
Plug 'joshdick/onedark.vim'
call plug#end()

let mapleader = " "

fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppattern %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TRIM_WHITE_SPACE_GROUP
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END

" cpp/c header guards
" Add header guard for header files
function! InsertHeaderGuard()
    let headerguard = "_" . substitute(toupper(expand("%:t")), "\\.", "_", "g") . "_"
    exe "normal gg"
    exe "normal O#ifndef " .headerguard
    exe "normal o#define " .headerguard
    exe "normal Go#endif //" .headerguard
    exe "normal O"
endfunction

autocmd! bufnewfile *.h,*.hpp exe "call InsertHeaderGuard()"



let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set completeopt=menuone,noinsert
set shortmess+=c
let g:ctrlp_working_path_mode = 0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif


set splitright
nnoremap <leader>t : vsplit term://zsh <CR>

colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE
