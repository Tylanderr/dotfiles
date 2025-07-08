return {
  "folke/trouble.nvim",
  event = "VeryLazy",
  config = function()
    require("trouble").setup({})

    vim.keymap.set("n", "<leader>qf", function()
      require("trouble").toggle("diagnostics")
    end)

    vim.keymap.set("n", "qn", function()
      require("trouble").next({skip_groups = true, jump = true})
    end)

    vim.keymap.set("n", "qp", function()
      require("trouble").prev({skip_groups = true, jump = true})
    end)
  end
}
