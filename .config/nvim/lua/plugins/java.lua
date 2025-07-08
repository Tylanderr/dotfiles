return {
  'nvim-java/nvim-java',
  ft = "java",
  config = function()
    require('java').setup({})
    require('lspconfig').jdtls.setup({
      settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "openjdk-17",
                path = "/usr/lib/jvm/",
                default = true,
              }
            }
          }
        }
      },
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
  end,
}
