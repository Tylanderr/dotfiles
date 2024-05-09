return {
  'stevearc/oil.nvim',
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true
    },
    keymaps = {
      -- overwrite default keymaps with custom functions
      ["<C-s>"] = { function()
        vim.cmd 'w'
      end },
      ["<C-h>"] = { function()
        local harpoon = require("harpoon")
        harpoon:setup()
        harpoon:list():select(1)
      end }
    }
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
}
