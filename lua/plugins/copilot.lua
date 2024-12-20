return {
  {
    "github/copilot.vim",
    event = "VimEnter",
    enable = false,
    init = function()
      vim.g.copilot_no_tab_map = false
      vim.g.copilot_workspace_folders = { vim.fn.getcwd() }
    end,
    keys = {},
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    cmd = "CopilotChat",
    enable = false,
    opts = function()
      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)

      return {
        auto_insert_mode = true,
        question_header = " " .. user .. " ",
        answer_header = " Copilot ",
        window = {
          width = 0.4,
        },
      }
    end,
    keys = {
      { "<C-s>", "<cr>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
      { "<leader>a", "", desc = "+AI", mode = { "n", "v" } },
      {
        "<leader>aa",
        function()
          return require("CopilotChat").toggle()
        end,
        desc = "Toggle (copilotchat)",
        mode = { "n", "v" },
      },
      {
        "<leader>ax",
        function()
          return require("CopilotChat").reset()
        end,
        desc = "Clear (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>aq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input)
          end
        end,
        desc = "Quick Chat (CopilotChat)",
        mode = { "n", "v" },
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-chat",
        callback = function()
          vim.opt_local.number = false
          vim.opt_local.relativenumber = false
        end,
      })

      chat.setup(opts)
    end,
  },
}
