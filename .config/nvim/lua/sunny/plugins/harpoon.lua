return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {"nvim-lua/plenary.nvim"},
  config = function()
      require("harpoon"):setup()
    end,
    keys = {
      { "<leader>t", function() require("harpoon"):list():append() end, desc = "harpoon file", },
      { "<A-a>", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "harpoon quick menu", },
      { "<A-1>", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
      { "<A-2>", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
      { "<A-3>", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
      { "<A-4>", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
      { "<A-5>", function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5", },
    },
}
