--  To check the current status of your plugins, run
--    :Lazy
--
--  To update plugins you can run
--    :Lazy update
--
require('lazy').setup({
  'tpope/vim-sleuth',

  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})
  { 'numToStr/Comment.nvim', opts = {} },

  require 'tyler/plugins/telescope',

  require 'tyler/plugins/java',

  require 'tyler/plugins/lspconfig',

  require 'tyler/plugins/cmp',

  require 'tyler/plugins/tokyonight',

  require 'tyler/plugins/todo-comments',

  require 'tyler/plugins/mini',

  require 'tyler/plugins/treesitter',

  require 'tyler/plugins/harpoon',

  require 'tyler/plugins/fugitive',

  require 'tyler/plugins/undotree',

  require 'tyler/plugins/autopairs',

  require 'tyler/plugins/refactoring',

  require 'tyler/plugins/trouble'
})

require('lspconfig').jdtls.setup {}
