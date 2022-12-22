
require("telescope").load_extension("undo")

local treesitter = require'nvim-treesitter.configs'
treesitter.setup {
  ensure_installed = {
    'c', 'cpp', 'dart', 'go', 'html', 'java', 'javascript', 'python', 'ruby',
    'rust', 'typescript'
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true
  },
  indent = {
    enable = false
  }
}

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.tsserver.setup{}

require'lspconfig'.ltex.setup{}

require'lspconfig'.eslint.setup{}

require'lspconfig'.pyright.setup{
    capabilities = capabilities
}
require'lspconfig'.bashls.setup{
    capabilities = capabilities
}
require'lspconfig'.dockerls.setup{
    root_dir = cwd,
    capabilities = capabilities
}

require'lspconfig'.clangd.setup {
    cmd = {
        -- see clangd --help-hidden
        "clangd",
        "--background-index",
        -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
        -- to add more checks, create .clang-tidy file in the root directory
        -- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
        "--clang-tidy",
        "--completion-style=bundled",
        "--cross-file-rename",
        "--header-insertion=iwyu",
    },
    capabilities = capabilities,
    init_options = {
        clangdFileStatus = true, -- Provides information about activity on clangd’s per-file worker thread
        usePlaceholders = true,
        completeUnimported = true,
        semanticHighlighting = true,
    },
    on_attach = on_attach,
    root_dir = function() return (vim.loop.cwd())end
}

require'lspconfig'.jdtls.setup{}

require'lspconfig'.sumneko_lua.setup {
    cmd = {"lua-language-server", "-E", "/usr/local/lib/lua-language-server/bin/Linux/main.lua"};
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
require'lspconfig'.rls.setup{
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = false,
      all_features = true,
    },
  },
}



require'lspconfig'.gopls.setup{}
require'lspconfig'.vuels.setup{}
require("better_escape").setup()
