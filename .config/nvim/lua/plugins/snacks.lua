local function palette_layout(height, width)
  height = height or 0.4
  width = width or 0.6
  return {
    preview = false,
    layout = {
      backdrop = false,
      width = 0.5,
      min_width = 80,
      height = 0.6,
      min_height = 3,
      box = "vertical",
      border = "rounded",
      title = "{title}",
      title_pos = "center",
      { win = "input",   height = 1,          border = "bottom" },
      { win = "list",    border = "none" },
      { win = "preview", title = "{preview}", height = 0.4,     border = "top" },
    },
  }
end

local function files_layout(preview_width, height, width)
  preview_width = preview_width or 0.6
  height = height or 0.8
  width = width or 0.8
  return {
    layout = {
      box = 'horizontal',
      width = width,
      min_width = 120,
      height = height,
      {
        box = 'vertical',
        border = 'rounded',
        title = '{title} {live} {flags}',
        { win = 'input', height = 1,     border = 'bottom' },
        { win = 'list',  border = 'none' },
      },
      { win = 'preview', title = '{preview}', border = 'rounded', width = preview_width },
    },
  }
end

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    picker = {
      enabled = true,
      sources = {
        files = { layout = palette_layout(), hidden = true },
        grep = { layout = files_layout() },
        buffers = { layout = files_layout() },
        grep_word = { layout = files_layout() },
        diagnostics = { layout = files_layout() },
        lsp_references = { layout = files_layout() },
        help = { layout = { preset = "ivy" } },
        keymaps = { layout = { preset = "ivy" } },
        undo = { layout = { preset = "ivy" } },
      },
    },
    quickfile = { enabled = true },
    indent = {
      enabled = true,
      animate = {
        enabled = false
      },
      filter = function(buf)
        local exclude = { "java", "typescript", "markdown", "go", "lazy", "lua" }
        local ft = vim.bo[buf].filetype
        return not vim.tbl_contains(exclude, ft)
      end
    },
    terminal = {
      win = {
        position = "float"
      }
    }
  },
  keys = {
    { "<leader><leader>", function() Snacks.picker.buffers() end,     desc = "Buffers" },
    { "<leader>fg",       function() Snacks.picker.grep() end,        desc = "Grep",                     nowait = true },
    { "<leader>ff",       function() Snacks.picker.files() end,       desc = "Find Files",               nowait = true },
    { "<leader>fw",       function() Snacks.picker.grep_word() end,   desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>fd",       function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>fh",       function() Snacks.picker.help() end,        desc = "Help Pages" },
    { "<leader>fk",       function() Snacks.picker.keymaps() end,     desc = "Keymaps" },
    { "<leader>u",        function() Snacks.picker.undo() end,        desc = "Undo History" },
    {
      "<C-t>",
      function()
        local current_dir = vim.fn.getcwd()
        -- Check if we're in terminal mode
        local in_terminal = vim.bo.buftype == "terminal"

        if in_terminal then
          -- Hide the terminal if we're in terminal mode
          vim.cmd("hide")
        else
          -- Show/create terminal if we're in normal mode
          Snacks.terminal.toggle("bash", {
            cwd = current_dir,
            env = {
              TERM = "xterm-256color",
            },
            win = {
              style = "terminal",
              relative = "editor",
              border = "rounded",
              backdrop = false,
              width = 0.60,
              height = 0.60,
            },
          })
        end
      end,
      desc = "Open Floating Terminal",
      mode = { "n", "t" }
    },
  }
}
