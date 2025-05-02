return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        signature = {
          auto_open = {
            enabled = false,
          },
        },
      },
      routes = {
        {
          filter = {
            event = "notify",
            find = "Could not find source",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "notify",
            find = "Request textDocument/documentHighlight failed",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "notify",
            find = "Request textDocument/inlayHint failed",
          },
          opts = { skip = true },
        },
      },
    },
  },
}
