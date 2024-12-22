-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Keymap helper
local map = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Normal mode
map("i", "jk", "<ESC>", { desc = "Normal mode" })

-- Save
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Quit all
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- Zen mode
map("n", "<leader>zz", "<cmd>Mindful<cr>", { desc = "Mindful mode" })

-- Neotree
map("n", "<leader>ee", "<cmd>Neotree toggle left<cr>", { desc = "Toggle tree" })
map("n", "<leader>ef", "<cmd>Neotree float<cr>", { desc = "Floating tree" })
map("n", "<leader>er", "<cmd>Neotree reveal left<cr>", { desc = "Reveal tree" })

-- Project (session)
map("n", "<leader>ps", "<cmd>SessionSave<cr>", { desc = "Save session" })
map("n", "<leader>pr", "<cmd>SessionRestore<cr>", { desc = "Restore session" })

-- Files
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Find recent files" })
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string" })
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

-- Copy & paste
map("n", "<leader>fR", "<cmd>Telescope registers<cr>", { desc = "Find registers" })

-- Buffers
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bN", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Other buffer" })
map("n", "<leader>bx", "<cmd>bd<cr>", { desc = "Delete window" })
map("n", "<leader>bf", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })

-- Code & LSP
map("n", "<leader>cr", "<cmd>Telescope lsp_references<cr>", { desc = "Find references" })
map("n", "<leader>cd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Find definitions" })
map("n", "<leader>ct", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "Find types" })
map("n", "<leader>ci", "<cmd>Telescope lsp_implementations<cr>", { desc = "Find implementations" })
map("n", "<leader>cs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Find symbols" })
map("n", "<leader>cS", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Global symbols" })
map("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>ck", vim.lsp.buf.hover, { desc = "Show documentation" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
map("n", "<leader>cR", "<cmd>LspRestart<CR>", { desc = "Restart LSP" })

-- Diagnostics
map("n", "<leader>df", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "File diagnostics" })
map("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Line diagnostics" })
map("n", "<leader>d]", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>d[", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })

-- Move lines
map("n", "<M-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<M-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<M-j>", "<Esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<M-k>", "<Esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<M-j>", "<cmd>m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<M-k>", "<cmd>m '<-2<cr>gv=gv", { desc = "Move up" })

-- Window
map("n", "<M-l>", ":vertical resize -5<cr>", { desc = "Resize left" })
map("n", "<M-h>", ":vertical resize +5<cr>", { desc = "Resize right" })

-- Tabs
map("n", "<leader>tl", "<cmd>tablast<cr>", { desc = "Last tab" })
map("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Close other tabs" })
map("n", "<leader>tf", "<cmd>tabfirst<cr>", { desc = "First tab" })
map("n", "<leader>tt", "<cmd>tabnew<cr>", { desc = "New tab" })
map("n", "<leader>tn", "<cmd>tabnext<cr>", { desc = "Next tab" })
map("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close tab" })
map("n", "<leader>tN", "<cmd>tabprevious<cr>", { desc = "Prev tab" })

-- Search
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Clear highlights" })
map("n", "n", "'Nn'[v:searchforward].'zv'", { desc = "Next result", expr = true })
map("x", "n", "'Nn'[v:searchforward]", { desc = "Next result", expr = true })
map("o", "n", "'Nn'[v:searchforward]", { desc = "Next result", expr = true })
map("n", "N", "'nN'[v:searchforward].'zv'", { desc = "Prev result", expr = true })
map("x", "N", "'nN'[v:searchforward]", { desc = "Prev result", expr = true })
map("o", "N", "'nN'[v:searchforward]", { desc = "Prev result", expr = true })

-- Autopairs close
vim.keymap.set("i", "<C-l>", function()
  local cursor = vim.api.nvim_win_get_cursor(0)[2] + 1
  local next_char = vim.api.nvim_get_current_line():sub(cursor, cursor)

  if next_char:match("[%)%]%}%>%\"`']") then
    return "<Right>"
  else
    return "<C-l>"
  end
end, { expr = true })
