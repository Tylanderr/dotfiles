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
        ["q"] = { "actions.close", nowait = true },
      },
    })
    vim.keymap.set("n", "-", "<cmd>Oil<CR>")
  end,
}
-- vim: ts=2 sts=2 sw=2 et
