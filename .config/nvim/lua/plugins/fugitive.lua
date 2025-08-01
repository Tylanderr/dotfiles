return {
  "tpope/vim-fugitive",
  event = "VeryLazy",
  config = function()
    vim.keymap.set("n", "<leader>gs", "<cmd>vertical Git<CR>")
    vim.keymap.set("n", "<leader>gt", "<cmd>tab Git<CR>")
    vim.keymap.set('n', '<leader>gc', ':Git commit -m ""<Left>')

    -- Create group of commands that only work within the fugitive buffer
    -- This allows for two "gt" commands to be set without having a conflict
    local Tyler_Fugitive = vim.api.nvim_create_augroup("Tyler_Fugitive", {})
    local autocmd = vim.api.nvim_create_autocmd
    autocmd("BufWinEnter", {
      group = Tyler_Fugitive,
      pattern = "*",
      callback = function()
        if vim.bo.ft ~= "fugitive" then
          return
        end
        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "<leader>P", function() vim.cmd.Git('push') end, opts)
        vim.keymap.set("n", "<leader>p", function() vim.cmd.Git({ 'pull', '--rebase' }) end, opts)
        vim.keymap.set("n", "<leader>gt", ":Git push -u origin ", opts);
      end,
    })
  end
}
-- vim: ts=2 sts=2 sw=2 et
