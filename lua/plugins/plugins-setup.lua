local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use "neanias/everforest-nvim"
    use "dhruvasagar/vim-table-mode"
    use "sbdchd/neoformat"  -- format code
    use "nvim-tree/nvim-web-devicons"
    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup()
        end,
    })
    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
        config = function()
            vim.g.mkdp_browser = "surf"
            vim.g.mkdp_markdown_css = "/home/haogwo/.config/nvim/lua/plugins/markdown-preview/custom.css"
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use "christoomey/vim-tmux-navigator"
    -- use "p00f/nvim-ts-rainbow"
    use "shellRaining/hlchunk.nvim"
    use 'norcalli/nvim-colorizer.lua'
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    use "lewis6991/gitsigns.nvim"  -- 左则git提示
    use "HiPhish/rainbow-delimiters.nvim"  -- rainbow brackets
    
    -- For code folding
    use {
        "kevinhwang91/nvim-ufo",
        requires = "kevinhwang91/promise-async"
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
    -- Language server protocol
    use 'neovim/nvim-lspconfig'

    -- Auto completion
    use 'hrsh7th/nvim-cmp'       -- 自动补全引擎
    use 'hrsh7th/cmp-nvim-lsp'   -- LSP源的补全
    use 'hrsh7th/cmp-buffer'     -- Buffer源补全
    use 'hrsh7th/cmp-path'       -- 文件路径补全
    use 'hrsh7th/cmp-cmdline'    -- 命令行补全
    use 'hrsh7th/vim-vsnip'      -- 补全时的片段支持
    use 'hrsh7th/cmp-vsnip'      -- VSnip源的补全
    use 'onsails/lspkind-nvim'   -- 自动补全图标

    if packer_bootstrap then
        require('packer').sync()
    end
end)
