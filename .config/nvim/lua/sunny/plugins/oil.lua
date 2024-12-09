return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require("oil")
    oil.setup({
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      }
    })
    vim.keymap.set("n", "-", oil.open, {})
  end,
}
