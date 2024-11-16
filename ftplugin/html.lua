vim.opt_local.expandtab = true
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

-- 仅在 HTML 文件中加载 live-preview.nvim 插件
require('live-preview').setup({
    commands = {
        start = 'LivePreview', -- 启动实时预览的命令
        stop = 'StopPreview', -- 停止实时预览的命令
    },
    port = 5500, -- 实时预览服务器的端口
    autokill = false, -- 自动关闭其他进程
    browser = 'default', -- 使用默认浏览器
    dynamic_root = false, -- 使用当前工作目录作为根目录
    sync_scroll = false, -- 是否同步滚动
    telescope = {
        false, -- 不自动加载 Telescope 扩展
    },
})

-- 添加自动命令
vim.cmd([[
  augroup LivePreview
    autocmd!
    autocmd BufDelete * if &filetype == 'html' | execute 'LivePreviewStop' | endif
  augroup END
]])

