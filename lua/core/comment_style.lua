vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"c", "cpp"},
    callback = function()
        vim.opt_local.formatoptions = vim.opt_local.formatoptions + "c" + "r" + "o"
        vim.opt_local.comments = "s1:/*,mb:*,ex:*/,://"
        vim.cmd("setlocal commentstring=/*\\ %s\\ */")
    end
})

