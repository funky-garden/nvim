"Welcome to Benny's NeoVim config :-)
"

" HELP
"
" To see what an option is run :h {config}
" Run :options to see a list of all options

let g:vimspector_enable_mappings = 'HUMAN'

packadd termdebug

call plug#begin('~/.vim/plugged')
" Plugins
" Lsp
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'
Plug 'ray-x/lsp_signature.nvim'

Plug 'othree/jsdoc-syntax.vim'
Plug 'matze/vim-move'

Plug 'puremourning/vimspector'

" Linter
Plug 'dense-analysis/ale'

" tree sitter {highlighting}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Lua stuffz ???
Plug 'tjdevries/nlua.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" status bar
Plug 'vim-airline/vim-airline'
"

Plug 'tpope/vim-commentary'
" Floating Terminal and Maximzer
Plug 'voldikss/vim-floaterm'
Plug 'szw/vim-maximizer'


" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Fuzzy Find
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'rking/ag.vim'
Plug 'tversteeg/registers.nvim'
"Themes
Plug 'tjdevries/colorbuddy.vim'
Plug 'Shadorain/shadotheme'
Plug 'Th3Whit3Wolf/onebuddy'
Plug 'nikolvs/vim-sunbather'
Plug 'lifepillar/vim-solarized8'
Plug 'joshdick/onedark.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'colepeters/spacemacs-theme.vim'
call plug#end()

let mapleader = " "

fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppattern %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup BENNY_GROUP
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set completeopt=menuone,noinsert
set shortmess+=c
