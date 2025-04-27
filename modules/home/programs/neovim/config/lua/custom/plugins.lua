local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "json",

        "go",
        "c",
        "c_sharp",
        "python",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufRead",
    config = function()
      require "custom.configs.treesitter-context"
    end,
  },
  {
    -- Copilot plugin
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    config = function()
      require "custom.configs.copilot"
    end,
    event = "InsertEnter",
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    opts = function()
      require "custom.configs.formatter"
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "lervag/vimtex",
    lazy = false,
  },
  {
    "nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "notjedi/nvim-rooter.lua",
    event = "CursorMoved",
    config = function()
      require("nvim-rooter").setup {
        rooter_patterns = { ".git", ".hg", ".svn" },
        trigger_patterns = { "*" },
        manual = false,
        fallback_to_parent = false,
        lazy = false,
      }
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "prettier",
        "grammarly-languageserver",
        "lua-language-server",
        "autopep8",
        "csharp-language-server",
        "textlint",
        "typescript-language-server",
        "html-lsp",
        "pyright",
        "stylua",
      },
    },
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "fatih/vim-go",
    ft = { "go" },
  },
  {
    "rust-lang/rust.vim",
    ft = { "rust" },
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  ["kyazdani42/nvim-tree.lua"] = {
    override_options = {
      open_on_setup = true,
      hijack_directories = {
        enable = true,
        auto_open = true,
      },
      -- update_cwd = true,
    },
  },
  {
    "brianhuster/live-preview.nvim",
    dependencies = {
      -- You can choose one of the following pickers
      "nvim-telescope/telescope.nvim",
    },
    ft = { "markdown", "html" },
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
}

return plugins
