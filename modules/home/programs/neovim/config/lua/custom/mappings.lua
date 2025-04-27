local M = {}

M.general = {
  n = {
    ["<leader>i"] = { "<cmd> :%s/^\\s*/&&/<CR>", "Convert tabs to 4 (Increase tabs by 2)" },

    -- Lazygit shortcut
    ["<leader>gg"] = { "<cmd> LazyGit <CR>", "Lazygit" },
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },

    -- Clear highlights
    ["<leader>h"] = { ":noh <CR>", "clear highlights" },
  },
}

M.nvimtree = {
  -- Focus and toggle, remove the focus one
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  },
}

M.tabufline = {
  n = {
    -- cycle through buffers
    ["<S-l>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<S-h>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<leader>q"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },

    ["<leader>n"] = { "<cmd> set rnu! <CR>", "Toggle line number" },
  },
}

M.telescope = {
  n = {
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fl"] = { "<cmd> Telescope grep_string <CR>", "Grep string under cursor" },
  },
}
return M
