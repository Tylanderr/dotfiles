return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
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
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    {"rcarriga/nvim-notify", opts = { stages = "static", render = "minimal", minimum_width = 10} },
  },
  vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" }),
  vim.keymap.set("n", "<leader>nt", "<cmd>Noice telescope<CR>", { desc = "Show noice messages in telescope" }),
}
