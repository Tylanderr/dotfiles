return {
  {
    'neovim/nvim-lspconfig',
    event = "VeryLazy",
    dependencies = {
      { 'williamboman/mason.nvim',           version = "^1.0.0" },
      { 'williamboman/mason-lspconfig.nvim', version = "^1.0.0" },
      { 'folke/lazydev.nvim',                ft = "lua",            opts = {} },
      { 'deathbeam/lspecho.nvim',            opts = { echo = true } },
      { 'hrsh7th/cmp-cmdline' },
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

      local servers = {
        'angularls',
        -- 'ansiblels',
        -- 'gopls',
        'html',
        'lua_ls',
        -- 'nginx_language_server',
        -- 'templ',
        'ts_ls',
        -- 'yamlls',
      }

      for _, server in pairs(servers) do
        vim.lsp.enable(server)
      end

      require('mason').setup()
    end,

    vim.diagnostic.config({
      virtual_text = true,
      underline = false,
    }),
  },
}
