return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    routes = {
      {
        filter = {
          event = 'msg_show',
          any = {
            { find = '%d+L, %d+B' },
            { find = '; after #%d+' },
            { find = '; before #%d+' },
            { find = '%d fewer lines' },
            { find = '%d more lines' },
            { find = 'Publish Diagnostics' },
            { find = 'Validate documents' },
            { find = 'lua_ls' },
          },
        },
        opts = { skip = true },
      }
    },
    messages = {
      enabled = true
    },
    notify = {
      enabled = false
    },
    lsp = {
      progress = {
        enabled = false
      }
    },
    commands = {
      history = {
        view = "popup"
      }
    },
  },
  dependencies = {
    { "MunifTanjim/nui.nvim" },
    { "rcarriga/nvim-notify", opts = { stages = "static", render = "minimal", minimum_width = 10 } },
  },
  vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" }),
  vim.keymap.set("n", "<leader>nl", "<cmd>NoiceHistory<CR>", { desc = "Show recent noice messages" }),
}
