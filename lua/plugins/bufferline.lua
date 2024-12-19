local colors = require("config.colors")

return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  enabled = false,
  version = "*",
  opts = {
    options = {
      always_show_bufferline = false,
      separator_style = "thin",
    },
    highlights = {
      fill = {
        bg = colors.bg_dark
      },
      buffer_visible = {
        bg = colors.bg_dark
      },
    }
  },
}
