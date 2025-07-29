return {
  'nvim-java/nvim-java',
  ft = "java",
  config = function()
    require('java').setup({
      java_test = {
        enable = true
      },
      java_debug_adapter = {
        enable = true,
        version = '0.58.2'
      },
      spring_boot_tools = {
        enable = true
      },
      notifications = {
        dap = false
      }
    })

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
    })
  end,
}
