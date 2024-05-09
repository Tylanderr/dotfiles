return {
  'stevearc/oil.nvim',
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      preview = {
        split = "right"
      },
      keymaps = {
        -- overwrite default keymaps with custom functions
        ["<C-s>"] = "<cmd>w<cr>",

        ["<C-h>"] = { function()
          local harpoon = require("harpoon")
          harpoon:setup()
          harpoon:list():select(1)
        end },
      }
    })
  end,
  vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
}
