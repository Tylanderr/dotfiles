return {
  {
    'neovim/nvim-lspconfig',
    event = "VeryLazy",
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'hrsh7th/cmp-cmdline',

      { 'deathbeam/lspecho.nvim', opts = { echo = true } },

      -- TODO: Neodev may be deprecated?
      -- This needs to be updated to lazydev.nvim when I migrate to nvim >= 0.10
      { 'folke/neodev.nvim',      opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('qr', vim.lsp.buf.references, '[Q]uick [R]eference')
          map('qn', '<cmd>cnext<CR>', '[Q]uick Reference [N]ext')
          map('qp', '<cmd>cprev<CR>', '[Q]uick Reference [P]revious')
          map('qc', '<cmd>cclose<CR>', '[Q]uick Reference [C]lose')
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          map('<leader>vd', function() vim.diagnostic.open_float() end, 'Open diagnostics float')
          map('<leader>li', "<cmd>LspInfo<CR>", 'Open LspInfo')
          map('<leader>lr', "<cmd>LspRestart<CR>", 'Restart LSP')

          local cmp = require("cmp")
          cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
              { name = 'buffer' }
            }
          })

          cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
              { name = 'path' }
            }, {
              {
                name = 'cmdline',
                option = {
                  ignore_cmds = { 'Man', '!' }
                }
              }
            })
          })
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- local root_pattern = require("lspconfig.util").root_pattern()
      local servers = {
        ts_ls = {},
        -- angularls = {
        --   root_dir = root_pattern("angular.json"),
        --   filetypes = { "angular", "typescript", "html", "typescriptreact", "typescript.tsx"}
        -- },

        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
      }

      require('mason').setup()

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,

    vim.diagnostic.config({
      virtual_text = false,
      underline = false,
    }),
  },
}
