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
    use {
        "instant-markdown/vim-instant-markdown",
        ft = { "markdown" },
        build = "yarn install",
        config = function()
            vim.g.instant_markdown_autostart = 0
        end,
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use({
        "stevearc/oil.nvim",
        config = function()
          require("oil").setup()
        end,
    })
    use "christoomey/vim-tmux-navigator"
    use "p00f/nvim-ts-rainbow"
    use "shellRaining/hlchunk.nvim"
    use 'norcalli/nvim-colorizer.lua'
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig"
    }

    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "L3MON4D3/LuaSnip" -- snippets引擎，不装这个自动补全会出问题
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"
    use "hrsh7th/cmp-path" -- 文件路径

    use "numToStr/Comment.nvim" -- gcc和gc注释
    use "lewis6991/gitsigns.nvim" -- 左则git提示

    if packer_bootstrap then
        require('packer').sync()
    end
end)
