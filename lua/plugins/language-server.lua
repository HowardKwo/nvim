-- Language Server Protocol Configuration
local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
    -- 禁用自动补全功能
    client.server_capabilities.completionProvider = false

    -- 禁用诊断信息
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    -- 保留 hoverProvider
    -- client.server_capabilities.hoverProvider = false
    client.server_capabilities.signatureHelpProvider = false
    client.server_capabilities.codeActionProvider = false

    -- 禁用诊断消息
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

    -- 定义快捷键
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

