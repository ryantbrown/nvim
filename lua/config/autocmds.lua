-- Create missing directories.
vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Create missing directories",
  pattern = "*",
  callback = function()
    local dir = vim.fn.expand("<afile>:p:h")

    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
