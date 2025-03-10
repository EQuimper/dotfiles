return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- enable mason and configure icons
    require('mason').setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      -- list of servers for mason to install
      ensure_installed = {
        -- "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint",
        "eslint_d",
      },
    })
  end,
}
