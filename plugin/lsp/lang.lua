
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.tsserver.setup{
    handlers = {
        ["textDocument/publishDiagnostics"] = function(_, _, params, client_id, _, config)
            if params.diagnostics ~= nil then
                local idx = 1
                while idx <= #params.diagnostics do
                    if params.diagnostics[idx].code == 80001 or params.diagnostics[idx].code == 7016 then
                        table.remove(params.diagnostics, idx)
                    else
                        idx = idx + 1
                    end
                end
            end
            vim.lsp.diagnostic.on_publish_diagnostics(_, _, params, client_id, _, config)
        end,
    },
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    init_options = {
        hostInfo = "neovim"
    },
    capabilities = capabilities,
    root_dir = function() return (vim.loop.cwd())end
}
require'lspconfig'.ltex.setup{}

require'lspconfig'.eslint.setup{}

require'lspconfig'.pyright.setup{
    capabilities = capabilities
}
require'lspconfig'.bashls.setup{
    capabilities = capabilities
}
require'lspconfig'.dockerls.setup{
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

