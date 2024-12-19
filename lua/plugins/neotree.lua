return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "echasnovski/mini.icons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        default_component_configs = {
          container = {
            enable_character_fade = true,
          },
          indent = {
            indent_size = 1,
            padding = 2,
            with_markers = false,
          },
          modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
          },
          name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
          },
          git_status = {
            symbols = {
              added = "",
              modified = "",
              deleted = "✖",
              renamed = "󰁕",

              untracked = "[u]",
              ignored = "[i]",
              unstaged = "[ ]",
              staged = "[s]",
              conflict = "[c]",
            },
          },
          file_size = { enabled = false },
          type = { enabled = false },
          last_modified = { enabled = false },
          created = { enabled = false },
          symlink_target = { enabled = false },
        },
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_hidden = true,
            hide_by_name = {
              "node_modules",
            },
            hide_by_pattern = {
              --"*.meta",
              --"*/src/*/tsconfig.json",
            },
            always_show = {
              --".gitignored",
            },
            always_show_by_pattern = {
              --".env*",
            },
            never_show = {
              ".DS_Store",
              "thumbs.db",
            },
            never_show_by_pattern = {
              --".null-ls_*",
            },
          },
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
        },
        buffers = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
        },
      })
    end,
  },
}
