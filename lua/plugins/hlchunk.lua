require('hlchunk').setup({
    chunk = {
        enable = true,
        use_treesitter = false,
        style = {
            { fg = "#42A5F5" },
        },
        chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "┌",
            left_bottom = "└",
            right_arrow = ">",
        }
    },
    indent = {
        enable = true,
        chars = { "│", "¦", "┆", "┊", },
        use_treesitter = false,
    },
    blank = {
        enable = true,
        chars = {
            " ",
        },
        style = {
            { bg = "#434437" },
            { bg = "#2f4440" },
            { bg = "#433054" },
            { bg = "#284251" },
        },
    },
    line_num = {
        style = {
            { fg = "#01D758" }
        }
    },
})
