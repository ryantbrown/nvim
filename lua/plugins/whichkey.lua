return {
  "folke/which-key.nvim",
  opts = {
    delay = function(ctx)
      return ctx.plugin and 0 or 500
    end,
    spec = {
      { "<leader>w", group = "Window" },
      { "<leader>t", group = "Tab" },
      { "<leader>f", group = "File" },
      { "<leader>b", group = "Buffer" },
      { "<leader>c", group = "Code" },
      { "<leader>e", group = "Explorer" },
      { "<leader>p", group = "Project" },
      { "<leader>s", group = "Substitute" },
      { "<leader>d", group = "Diagnostics" },
      { "<leader>x", group = "Trouble" },
    },
  },
}
