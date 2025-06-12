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
    explorer = { enabled = false },
    indent = { enabled = false },
    input = { enabled = false },
    picker = { enabled = true },
    notifier = { enabled = false },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
  keys = {
    -- Top Pickers & Explorer
    { "<leader>fc",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
    -- find
    { "<leader><leader>",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "Find Files" },
    -- Grep
    { "<leader>fw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
    -- search
    { "<leader>fd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
    { "<leader>vh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
    { "<leader>fk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
    { "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undo History" },
    -- LSP
    { "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
    { "gD",              function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
    { "gr",              function() Snacks.picker.lsp_references() end,                          nowait = true,                     desc = "References" },
    { "gi",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
    { "gy",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
    -- Other
    { "<leader>gg",      function() Snacks.lazygit() end,                                        desc = "Lazygit" },
  }
}
