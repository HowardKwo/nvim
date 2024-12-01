require('vscode').setup({
    style = 'dark',
    -- Enable italic comment
    italic_comments = true,
    -- Underline `@markup.link.*` variants
    underline_links = true,
    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,
})
vim.cmd.colorscheme "vscode"
