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
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'ray-x/lsp_signature.nvim'
Plug 'itspriddle/vim-shellcheck'
Plug 'nacitar/a.vim'
Plug 'max397574/better-escape.nvim'
" completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

"nginx highlighting
Plug 'chr4/nginx.vim'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'andythigpen/nvim-coverage'

" tree sitter {highlighting}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Lua stuffz ???
Plug 'ray-x/lsp_signature.nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'tjdevries/nlua.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

" status bar
" Plug 'vim-airline/vim-airline'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons' " lua

" Comments
Plug 'tpope/vim-commentary'
Plug 'othree/jsdoc-syntax.vim'

" Enhance Vim
Plug 'tpope/vim-surround'

" Maximzer
Plug 'szw/vim-maximizer'

" git
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'airblade/vim-gitgutter'

" Fuzzy Find
" Plug 'kien/ctrlp.vim'
" Plug 'rking/ag.vim'
" Plug 'tversteeg/registers.nvim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'debugloop/telescope-undo.nvim'
Plug 'cljoly/telescope-repo.nvim'


Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" visual increment (ctrl-a)
Plug 'triglav/vim-visual-increment'

Plug 'voldikss/vim-floaterm'
"Themes
Plug 'joshdick/onedark.vim'
Plug 'neoclide/vim-jsx-improve'

call plug#end()


let mapleader = " "

fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppattern %s/\s\+$//e
    call winrestview(l:save)
endfun

"trim end of line whitespace on save
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
    exe "normaet o#define " .headerguard
    exe "normal Go#endif //" .headerguard
    exe "normal O"
endfunction
autocmd! bufnewfile *.h,*.hpp exe "call InsertHeaderGuard()"

" Spell Checking for Mardown and GitCommit files
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set completeopt=menu,menuone,noselect
" let g:ctrlp_working_path_mode = 0
" let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" let g:ctrlp_open_new_file = 'r'
" if executable('ag')
"     let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" endif

set splitright
let  g:floaterm_autoinsert = 'false'
nnoremap <leader>t : FloatermToggle<CR>

colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE
set encoding=UTF-8

" Stop using the fucking arrow keys bitch
" Disable Arrow keys in Normal mode
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

" " Disable Arrow keys in Insert mode
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>
autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2

let b:coverage_provider= 'gcov'
" Align switch statements with case labels
set cino=l1
" Scope declarations aligned with block
set cino=g0
