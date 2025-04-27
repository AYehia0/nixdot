require("conform").setup {
  format_on_save = {
    timeout_ms = 200,
    lsp_fallback = true,
  },
  formatters_by_ft = {
    cs = { "csharpier" },
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettier" } },
    typescript = { { "prettier" } },
  },
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format { bufnr = args.buf }
  end,
})
