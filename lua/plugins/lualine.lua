return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local colors = require("config.colors")
      local icons = require("mini.icons")

      require("lualine").setup({
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            -- {
            --   "buffers",
            --   use_mode_colors = false,
            --
            --   buffers_color = {
            --     active = { bg = colors.bg_highlight, fg = colors.white },
            --     inactive = { bg = colors.bg, fg = colors.fg },
            --   },
            -- },
            function()
              if vim.bo.filetype == "neo-tree" then
                return ""
              end

              local name = vim.fn.expand("%:t")
              local icon = icons.get("extension", vim.bo.filetype)

              return icon and (icon .. " " .. name) or name
            end,
          },
          lualine_c = { "branch", "diff", "diagnostics" },
          lualine_x = {
            -- function()
            --   if vim.bo.filetype == "neo-tree" then
            --     return ""
            --   end
            --   return vim.bo.filetype
            -- end,
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        options = {
          component_separators = "",
          section_separators = { left = "", right = "" },
          theme = {
            normal = {
              a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
              b = { bg = colors.bg_highlight, fg = colors.white },
              c = { bg = colors.bg, fg = colors.fg },
            },
            insert = {
              a = { bg = colors.green, fg = colors.bg, gui = "bold" },
              b = { bg = colors.bg, fg = colors.fg },
              c = { bg = colors.bg, fg = colors.fg },
            },
            visual = {
              a = { bg = colors.purple, fg = colors.bg, gui = "bold" },
              b = { bg = colors.bg, fg = colors.fg },
              c = { bg = colors.bg, fg = colors.fg },
            },
            command = {
              a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
              b = { bg = colors.bg, fg = colors.fg },
              c = { bg = colors.bg, fg = colors.fg },
            },
            replace = {
              a = { bg = colors.red, fg = colors.bg, gui = "bold" },
              b = { bg = colors.bg, fg = colors.fg },
              c = { bg = colors.bg, fg = colors.fg },
            },
            inactive = {
              a = { bg = colors.bg, fg = colors.bg },
              b = { bg = colors.bg, fg = colors.bg },
              c = { bg = colors.bg, fg = colors.bg },
              x = { bg = colors.bg, fg = colors.bg },
              y = { bg = colors.bg, fg = colors.bg },
              z = { bg = colors.bg, fg = colors.bg },
            },
          },
        },
      })
    end,
  },
}
