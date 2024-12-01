require('telescope').setup{
    defaults = {
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        mappings = {
            i = {
                ["<C-h>"] = "which_key",
            },
        },
        prompt_prefix = "❯ ",
    },
    color_devicons = true,
    disable_devicons = false,
    borderchars = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
    file_icon = true,
    pickers = {},
    extensions = {}
}
