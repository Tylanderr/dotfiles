return {
  "folke/noice.nvim",
  event = "VeryLazy",
  version = "4.4.7",
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
            { find = 'Type  :qa' },

            -- jdtls messages to ignore
            { find = 'Publish Diagnostics' },
            { find = 'Validate documents' },
            { find = 'Building -' },

            -- lua_ls messages to ignore
            { find = 'Diagnosing -' },
            { find = 'Processing -' },
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
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
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
    { "rcarriga/nvim-notify", commit = "fbef5d32be8466dd76544a257d3f3dce20082a07", opts = { stages = "static", render = "minimal", minimum_width = 10 } },
  },
  vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" }),
  vim.keymap.set("n", "<leader>nl", "<cmd>NoiceHistory<CR>", { desc = "Show recent noice messages" }),
}
