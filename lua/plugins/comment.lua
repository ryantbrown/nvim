return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local comment = require("Comment")
    local ts_context = require("ts_context_commentstring.integrations.comment_nvim")

    ---@diagnostic disable-next-line: missing-fields
    comment.setup({
      toggler = {
        line = "gcc",
        block = "gbc",
      },
      opleader = {
        line = "gc",
        block = "gb",
      },
      extra = {
        above = "gcO", -- Add comment on the line above
        below = "gco", -- Add comment on the line below
        eol = "gcA", -- Add comment at the end of line
      },
      pre_hook = ts_context.create_pre_hook(),
    })
  end,
}
