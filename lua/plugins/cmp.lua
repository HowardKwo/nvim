-- 1. 配置 nvim-cmp 自动补全引擎
local cmp = require('cmp')
local lspkind = require('lspkind')

-- 定义辅助函数来检查是否在插入模式的开头
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- 定义辅助函数 `feedkey`
local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
  snippet = {
    -- 指定片段引擎
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  mapping = {
    -- 使用 <Tab> 选择下一个补全项
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#expandable"]() == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- 如果以上条件不满足则调用 fallback
      end
    end, { "i", "s" }),

    -- 使用 <S-Tab> 选择上一个补全项
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      else
        fallback()
      end
    end, { "i", "s" }),

    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },

  -- 设置补全源
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'buffer' },
    { name = 'path' },
  },

  -- 使用 lspkind 增加图标
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',  -- 显示符号和文本
      maxwidth = 50,         -- 限制弹窗宽度
      ellipsis_char = '...', -- 当文字过长截断
    })
  }
})

-- 2. 配置 LSP 与 nvim-cmp 的结合
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 配置 pyright 和 clangd
require('lspconfig').pyright.setup{
  capabilities = capabilities,
}

require('lspconfig').clangd.setup{
  capabilities = capabilities,
}

-- 配置 tsserver 以支持 JavaScript 和 TypeScript
require('lspconfig').ts_ls.setup{
  capabilities = capabilities,
}

