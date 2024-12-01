require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "vim",
        "bash",
        "c",
        "cpp",
        "java",
        "lua",
        "html",
        "css",
        "go",
        "python",
        "javascript",
        "json",
        "sql"
    },
    highlight = { enable = true },
    indent = { enable = true },

    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}
