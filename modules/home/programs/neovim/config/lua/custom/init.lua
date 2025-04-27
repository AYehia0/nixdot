local autocmd = vim.api.nvim_create_autocmd

-- autocmd BufEnter * silent! lcd %:p:h
-- the same as autochdir but better for nvim-tree and other plugins.

-- vim.opt.autochdir = true
autocmd("BufEnter", {
  pattern = "*",
  command = "if expand('%:p:h') !~ '^/tmp' | silent! lcd %:p:h | endif",
})

vim.opt.number = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 50

-- disable auto comment
-- set formatoptions-=cro
vim.cmd "autocmd BufEnter * set formatoptions-=cro"
vim.cmd "autocmd BufEnter * setlocal formatoptions-=cro"
