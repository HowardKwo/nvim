-- 1. 配置nvim-cmp自动补全引擎
local cmp = require('cmp')
local lspkind = require('lspkind')

-- 定义辅助函数来检查是否在插入模式的开头
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({

  snippet = {
    -- 指定片段引擎
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  mapping = {
    -- Use <Tab> to select the next item
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn  == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function will be called if the above conditions are not met
      end
    end, { "i", "s" }),

    -- Use <S-Tab> to select the previous item
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

  -- Set formatting to include lspkind icons
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',  -- Show symbol and text
      maxwidth = 50,         -- Prevents the popup from becoming too wide
      ellipsis_char = '...', -- When text is truncated
    })
  }
})

-- 2. 配置LSP与nvim-cmp的结合
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 在你的LSP配置中加入capabilities
require('lspconfig').pyright.setup{
  capabilities = capabilities,
}

require('lspconfig').clangd.setup{
  capabilities = capabilities,
}

