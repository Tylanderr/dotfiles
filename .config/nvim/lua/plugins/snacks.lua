return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    picker = { enabled = true },
    quickfile = { enabled = true },
    lazygit = { enabled = true },
    indent = { enabled = false }
  },
  keys = {
    { "<leader>fc",       function() Snacks.picker.grep() end,        desc = "Grep" },
    { "<leader><leader>", function() Snacks.picker.buffers() end,     desc = "Buffers" },
    { "<leader>ff",       function() Snacks.picker.files() end,       desc = "Find Files" },
    { "<leader>fw",       function() Snacks.picker.grep_word() end,   desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>fd",       function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>vh",       function() Snacks.picker.help() end,        desc = "Help Pages" },
    { "<leader>fk",       function() Snacks.picker.keymaps() end,     desc = "Keymaps" },
    { "<leader>u",        function() Snacks.picker.undo() end,        desc = "Undo History" },
    { "<leader>lg",       function() Snacks.lazygit() end,            desc = "Lazygit" },
    { "<leader>gb",       function() Snacks.git.blame_line() end,     desc = "Git Blame Line" },
  }
}
