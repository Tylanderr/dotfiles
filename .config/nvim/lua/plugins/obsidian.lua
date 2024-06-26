return {
  "epwalsh/obsidian.nvim",
  version = "*",
  event = "VeryLazy",
  ft = "markdown",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "obsidian-developer-vault",
        path = "~/vaults/obsidian-developer-vault",
      },
    },
    ui = {
      enable = false
    }
  },
}
