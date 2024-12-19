return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local substitute = require("substitute")

    substitute.setup()

    local map = vim.keymap.set

    map("n", "<leader>ss", substitute.operator, { desc = "Substitute with motion" })
    map("x", "<leader>ss", substitute.visual, { desc = "Substitute in visual mode" })
    map("n", "<leader>sl", substitute.line, { desc = "Substitute line" })
    map("n", "<leader>sS", substitute.eol, { desc = "Substitute to end of line" })
  end,
}
