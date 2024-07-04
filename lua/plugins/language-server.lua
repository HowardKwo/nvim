-- Language Server Protocol Configuration
local lspconfig = require('lspconfig')

-- 全局禁用 LSP 的默认语法检查和代码补全
local on_attach = function(client, bufnr)
    -- 禁用自动补全功能
    client.server_capabilities.completionProvider = false

    -- 禁用诊断信息
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.signatureHelpProvider = false
    client.server_capabilities.codeActionProvider = false

    -- disable output hint message
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

