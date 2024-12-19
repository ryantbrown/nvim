return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    local colors = require("config.colors")

    require("tokyonight").setup({
      style = "moon",
      on_colors = function(theme)

        -- Background
        theme.bg = colors.bg
        theme.bg_dark = colors.bg
        theme.bg_float = colors.bg
        theme.bg_popup = colors.bg
        theme.bg_sidebar = colors.bg
        theme.bg_statusline = colors.bg
        theme.bg_search = colors.bg_highlight
        theme.bg_highlight = colors.bg_highlight
        theme.bg_visual = colors.bg_highlight

        -- Border
        theme.border = colors.border

        -- Foreground
        theme.fg = colors.fg
        theme.fg_dark = colors.fg
        theme.fg_float = colors.fg
        theme.fg_gutter = colors.fg
        theme.fg_sidebar = colors.fg
      end,
    })

    vim.cmd("colorscheme tokyonight")

    vim.api.nvim_set_hl(0, "PmenuSel", {
      bg = colors.bg_highlight,
      bold = true
    })

  end,
}
