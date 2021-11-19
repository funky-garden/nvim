
require'lspconfig'.tsserver.setup{
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    init_options = {
      hostInfo = "neovim"
    },
    root_dir = function() return (vim.loop.cwd())end
}

require'lspconfig'.eslint.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.bashls.setup{}

require'lspconfig'.clangd.setup {
    on_attach = on_attach,
    root_dir = function() return (vim.loop.cwd())end
    }

require'lspconfig'.sumneko_lua.setup {
  cmd = {"lua-language-server", "-E", "/usr/local/lib/lua-language-server/bin/Linux/main.lua"};
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
