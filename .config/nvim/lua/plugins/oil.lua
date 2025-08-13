return {
  "stevearc/oil.nvim",
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        -- overwrite default keymaps with custom functions
        ["<C-s>"] = false,
        ["<C-h>"] = false,
        ["<C-j>"] = false,
        ["<C-k>"] = false,
        ["<C-l>"] = false,
        ["<C-c>"] = false,
        ["<C-t>"] = false,
        ["<C-q>"] = { "actions.close", nowait = true },
      },
      float = {
        padding = 2,
        max_width = 110,
        max_height = 35,
        border = "rounded",
        win_options = {
          winblend = 1
        },
        override = function(conf)
          return conf
        end
      }
    })
    vim.keymap.set("n", "-", require("oil").open_float)
    vim.keymap.set("n", "<leader>-", "<cmd>Oil<CR>")
  end,
}
-- vim: ts=2 sts=2 sw=2 et
