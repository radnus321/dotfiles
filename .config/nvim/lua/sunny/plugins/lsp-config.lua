return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup_handlers({
        -- default handler for installed servers
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["lua_ls"] = function()
          -- configure lua server (with special settings)
          lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                -- make the language server recognize "vim" global
                diagnostics = {
                  globals = { "vim" },
                },
                completion = {
                  callSnippet = "Replace",
                },
              }
            }
          })
        end,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

      vim.diagnostic.config({ float = true })
      vim.keymap.set('n', '<leader>gl', vim.diagnostic.open_float, {})
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})

      vim.fn.sign_define('DiagnosticSignError', { text = '✘', texthl = 'DiagnosticSignError' })
      vim.fn.sign_define('DiagnosticSignWarn', { text = '▲', texthl = 'DiagnosticSignWarn' })
      vim.fn.sign_define('DiagnosticSignInfo', { text = '»', texthl = 'DiagnosticSignInfo' })
      vim.fn.sign_define('DiagnosticSignHint', { text = '⚑', texthl = 'DiagnosticSignHint' })
    end,
  },
}
