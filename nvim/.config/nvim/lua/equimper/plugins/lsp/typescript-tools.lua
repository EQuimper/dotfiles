return {
  "pmizio/typescript-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  event = "BufReadPre",
  config = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
      callback = function()
        vim.cmd("TSToolsAddMissingImports sync")
        vim.cmd("TSToolsOrganizeImports sync")
      end,
    })
    require("typescript-tools").setup({
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      settings = {
        jsx_close_tag = {
          enable = true,
          filetypes = { "javascriptreact", "typescriptreact" },
        },
        expose_as_code_action = {
          "fix_all",
          "add_missing_imports",
          "remove_unused",
          "organize_imports",
        },
        publish_diagnostic_on = "change",
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayEnumMemberValueHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayVariableTypeHints = true,
        },
      },
    })
  end,
}
