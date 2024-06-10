return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',

        build = 'make',

        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            prompt_position = 'top',
            horizontal = {
              width = 0.90,
              height = 0.90,
            }
          },
          sorting_strategy = 'ascending',
          path_display = { truncate = 2 },
        },
        pickers = {
          find_files = { previewer = false, layout_config = { horizontal = { width = 0.5, height = 0.65, } } },
          diagnostics = { previewer = false },

          -- All these pickers are setup the same. Setting preview_width within the defaults layout causes an error
          -- to be thrown when using Code Actions
          grep_string = { layout_config = { preview_width = 0.65, } },
          live_grep = { layout_config = { preview_width = 0.65, } },
          buffers = { layout_config = { preview_width = 0.65, } },
          help_tags = { layout_config = { preview_width = 0.65, } },
          lsp_references = { layout_config = { preview_width = 0.65, } },
          lsp_definitions = { layout_config = { preview_width = 0.65, } },
          lsp_implementations = { layout_config = { preview_width = 0.65, } },
          lsp_type_definitions = { layout_config = { preview_width = 0.65, } },
          lsp_document_symbols = { layout_config = { preview_width = 0.65, } },
          lsp_dynamic_workspace_symbols = { layout_config = { preview_width = 0.65, } },
        }
      }

      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
      vim.keymap.set('n', '<leader>fc', builtin.live_grep, { desc = 'Find Content Grep Live view' })
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "Find keymaps" })
      vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = "Find current word by grep" })
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = "Find Diagnostics" })
      vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "View help" })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = "Open buffers" })

      vim.keymap.set('n', '<leader>fh', "<CMD>lua require('telescope.builtin').find_files({hidden = true})<CR>", silent)
      vim.keymap.set("n", "<Leader>wt", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", silent)
      vim.keymap.set("n", "<Leader>WT", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", silent)

      vim.keymap.set('n', '<leader>fg', function()
        builtin.grep_string { search = vim.fn.input 'Grep > ' }
      end, { desc = "Find content of files by grep" })

    end,
  },
}
