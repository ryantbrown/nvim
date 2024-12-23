return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
    { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<cr>"] = cmp.mapping.confirm({ select = false }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "path", group_index = 2 },
      }),
      ---@diagnostic disable-next-line: missing-fields
      formatting = {
        format = function(entry, item)
          item = require("lspkind").cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
          })(entry, item)
          item = require("tailwindcss-colorizer-cmp").formatter(entry, item)

          return item
        end,
      },
    })

    -- Use buffer source for `/` and `?`
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- Use cmdline & path source for ':'
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
      ---@diagnostic disable-next-line: missing-fields
      matching = { disallow_symbol_nonprefix_matching = false },
    })
  end,
}
