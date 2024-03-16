require('hlchunk').setup({
    chunk = {
        enable = true,
        use_treesitter = true,
        style = {
            { fg = "#42A5F5" },
        },
        chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
        }
    },
    indent = {
        enable = true,
        chars = { "│", "¦", "┆", "┊", },
        use_treesitter = false,
    },
    blank = {
        enable = false,
    },
    line_num = {
        use_treesitter = true,
        style = {{ fg = "#01D758" }}
    },
})
