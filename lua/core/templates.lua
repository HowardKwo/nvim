-- Define template files location
local template_file_path = os.getenv("HOME") .. "/.config/nvim/lua/templates/"
-- Define a function to set up autocmds for specific filetypes
local function setup_autocmds()
    -- Define autocmds for specific filetypes
    vim.cmd("autocmd BufNewFile *.html 0r" .. template_file_path .. "html.skel")
    vim.cmd("autocmd BufNewFile *.c    0r" .. template_file_path .. "c.skel")
    vim.cmd("autocmd BufNewFile *.cc   0r" .. template_file_path .. "cpp.skel")
    vim.cmd("autocmd BufNewFile *.cpp  0r" .. template_file_path .. "cc.skel")
    vim.cmd("autocmd BufNewFile *.sh   0r" .. template_file_path .. "sh.skel")
end

-- Call the function to set up autocmds
setup_autocmds()

