require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")

---@diagnostic disable-next-line: missing-fields
require("lazy").setup({ { import = "plugins" } }, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
