require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
    "pyright",
    "clangd",
    "html",
    "cssls",
    "ts_ls",
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
}

-- Language Server Protocol Configuration
local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true }
    client.server_capabilities.signatureHelpProvider = false
    client.server_capabilities.codeActionProvider = false
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-d>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
end

-- 配置 Python 语言服务器
lspconfig.pyright.setup{
    on_attach = on_attach,
}

-- 配置 C/C++ 语言服务器
lspconfig.clangd.setup{
    on_attach = on_attach,
}

-- 配置 TypeScript 语言服务器
lspconfig.ts_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
}

lspconfig.html.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.cssls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

local signs = { Error = "", Warn = "", Hint = "", Info = "󰋽" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
