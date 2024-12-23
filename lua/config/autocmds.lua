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

-- Try to lint on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  callback = function()
    local filepath = vim.api.nvim_buf_get_name(0)
    local view = vim.fn.winsaveview()
    local filetype = vim.bo.filetype

    vim.schedule(function()
      os.execute("biome lint --fix '" .. filepath .. "'" .. " > /dev/null 2>&1")
      vim.cmd("noautocmd edit!")
      vim.fn.winrestview(view)

      vim.bo.filetype = filetype
      vim.cmd("syntax enable")
      vim.cmd("redraw!")
    end)
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
