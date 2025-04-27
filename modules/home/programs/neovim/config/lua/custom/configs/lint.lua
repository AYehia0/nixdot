local lint = require "lint"

lint.linters_by_ft = {
  -- TS/JS languages
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },

  -- TODO: Python
}

-- try the linter on load
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    lint.try_lint()
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})
