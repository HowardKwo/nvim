-- Language Server Protocol Configuration
local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-d>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

-- 配置 Python 语言服务器
lspconfig.pyright.setup{
    on_attach = on_attach,
}

-- 配置 C/C++ 语言服务器
lspconfig.clangd.setup{
    on_attach = on_attach,
}

local signs = { Error = "", Warn = "", Hint = "", Info = "󰋽" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
