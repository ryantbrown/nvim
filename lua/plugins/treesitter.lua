return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<BS>", desc = "Decrement Selection", mode = "x" },
        { "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    dependencies = {
      "windwp/nvim-ts-autotag",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    keys = {
      { "<c-space>", desc = "Increment Selection" },
      { "<bs>", desc = "Decrement Selection", mode = "x" },
    },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup({
        indent = { enable = true },
        highlight = { enable = true },
        autotag = { enable = true },
        ensure_installed = {
          "lua",
          "vim",
          "bash",
          "diff",
          "html",
          "css",
          "json",
          "jsonc",
          "lua",
          "luadoc",
          "luap",
          "yaml",
          "toml",
          "python",
          "sql",
          "regex",
          "javascript",
          "typescript",
          "tsx",
          "markdown",
          "markdown_inline",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    enabled = true,
  },
}
