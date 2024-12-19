return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        typescript = { "biome" },
        typescriptreact = { "biome" },
        css = { "biome" },
        html = { "biome" },
        json = { "biome" },
        yaml = { "biome" },
        markdown = { "biome" },
        lua = { "stylua" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })
  end,
}
