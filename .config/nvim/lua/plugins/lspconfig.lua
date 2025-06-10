return {
  {
    'neovim/nvim-lspconfig',
    event = "VeryLazy",
    dependencies = {
      { 'williamboman/mason.nvim',                  version = "^1.0.0" },
      { 'williamboman/mason-lspconfig.nvim',        version = "^1.0.0" },
      { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
      { 'hrsh7th/cmp-cmdline' },
      { 'deathbeam/lspecho.nvim',                   opts = { echo = true } },
      {
        'folke/lazydev.nvim',
        ft = "lua",
        opts = {
          library = {
            -- Load luvit types when the `vim.uv` word is found
            { path = "luvit-meta/library",      words = { "vim%.uv" } },
            { path = "/usr/share/awesome/lib/", words = { "awesome" } },
          }
        }
      },
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
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      require('mason').setup()
    end,

    vim.diagnostic.config({
      virtual_text = true,
      underline = false,
    }),
  },

  vim.lsp.enable('angularls'),
  vim.lsp.enable('ansiblels'),
  vim.lsp.enable('gopls'),
  vim.lsp.enable('html'),
  vim.lsp.enable('lua_ls'),
  vim.lsp.enable('nginx_language_server'),
  vim.lsp.enable('sqls'),
  vim.lsp.enable('templ'),
  vim.lsp.enable('ts_ls'),
  vim.lsp.enable('yamlls'),
}
