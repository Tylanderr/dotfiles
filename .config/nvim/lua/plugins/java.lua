return {
  'nvim-java/nvim-java',
  ft = "java",
  config = function()
    require('java').setup({
      java_test = {
        enable = false
      },
      java_debug_adapter = {
        enable = false
      },
      spring_boot_tools = {
        enable = false
      },
      notifications = {
        dap = false
      }
    })
    require('lspconfig').jdtls.setup({})
  end,
}
