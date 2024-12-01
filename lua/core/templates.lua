-- Define the directory for template files
local templates_directory = vim.fn.expand('~/.config/nvim/lua/templates')

-- Function to insert template
local function insert_template(template_file)
    -- Read the content of the template file
    local template_path = templates_directory .. '/' .. template_file
    local file = io.open(template_path, "r")
    if not file then
        print("Could not open template file: " .. template_path)
        return
    end
    local template_content = file:read("*a")
    file:close()

    -- Get the current time
    local current_time = os.date("%Y-%m-%d %H:%M:%S")
    local current_date = os.date("%Y-%m-%d")

    -- Replace placeholders in the template with the current time or current date
    local result = template_content:gsub("{{CURRENT_TIME}}", current_time)
    local result = template_content:gsub("{{CURRENT_DATE}}", current_date)

    -- Insert the processed content at the beginning of the buffer
    vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(result, "\n"))
end

-- Auto command group
vim.api.nvim_create_augroup('FiletypeTemplates', { clear = true })

-- Insert template based on file type
vim.api.nvim_create_autocmd('BufNewFile', {
    group = 'FiletypeTemplates',
    pattern = '*.py',
    callback = function() insert_template('py.skel') end
})
vim.api.nvim_create_autocmd('BufNewFile', {
    group = 'FiletypeTemplates',
    pattern = '*.js',
    callback = function() insert_template('js.skel') end
})
vim.api.nvim_create_autocmd('BufNewFile', {
    group = 'FiletypeTemplates',
    pattern = '*.html',
    callback = function() insert_template('html.skel') end
})
vim.api.nvim_create_autocmd('BufNewFile', {
    group = 'FiletypeTemplates',
    pattern = '*.c',
    callback = function() insert_template('c.skel') end
})
vim.api.nvim_create_autocmd('BufNewFile', {
    group = 'FiletypeTemplates',
    pattern = '*.cpp',
    callback = function() insert_template('cpp.skel') end
})
vim.api.nvim_create_autocmd('BufNewFile', {
    group = 'FiletypeTemplates',
    pattern = '*.sh',
    callback = function() insert_template('sh.skel') end
})

