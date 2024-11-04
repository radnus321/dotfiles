return {
  -- Add your existing plugins here

  -- Add booperlv/nvim-gomove using Lazy.nvim
  {
    "booperlv/nvim-gomove",
    config = function()
      -- Optional: Add any configuration you need for the plugin here
      require("gomove").setup({
        -- Default configurations (modify as needed)
      })
    end
  },
}

