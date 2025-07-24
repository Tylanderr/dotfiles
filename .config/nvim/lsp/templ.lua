return {
  cmd = { 'templ', 'lsp' },
  filetypes = { 'templ' },
  root_markers = { 'go.work', 'go.mod', '.git' },

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "templ",
    callback = function()
      vim.bo.commentstring = "// %s"
    end
  })
}

