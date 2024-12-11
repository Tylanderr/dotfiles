require('lazy').setup({
  { 'tpope/vim-sleuth',      event = "VeryLazy", },
  { 'numToStr/Comment.nvim', event = "VeryLazy", opts = {} },
  { 'windwp/nvim-autopairs', event = "VeryLazy", opts = {} },

  require 'plugins/intro',
  require 'plugins/telescope',
  require 'plugins/lspconfig',
  require 'plugins/cmp',
  require 'plugins/debug',
  require 'plugins/tokyonight',
  require 'plugins/todo-comments',
  require 'plugins/mini',
  require 'plugins/treesitter',
  require 'plugins/indent',
  require 'plugins/harpoon',
  require 'plugins/fugitive',
  require 'plugins/undotree',
  require 'plugins/refactoring',
  require 'plugins/noice',
  require 'plugins/lualine',
  require 'plugins/oil',
  require 'plugins/java',
  require 'plugins/dadbod',
})
