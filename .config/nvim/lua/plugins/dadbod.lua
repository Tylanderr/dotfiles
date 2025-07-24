return {
  'kristijanhusak/vim-dadbod-ui',
  lazy = true,
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.omni_sql_no_default_maps = 1
    vim.g.db_ui_save_location='~/connections/'
    vim.keymap.set("n", "<leader>db", "<cmd>tabnew|DBUIToggle<CR>")
  end,
}
