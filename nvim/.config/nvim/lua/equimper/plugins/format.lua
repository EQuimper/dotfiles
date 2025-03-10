return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  init = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })
  end,
  opts = function()
    local opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_format = "fallback", -- not recommended to change
      },
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        typescript = { "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        javascript = { "prettier", stop_after_first = true },
        javascriptreact = { "prettier", stop_after_first = true },
        json = { "prettier", stop_after_first = true },
        html = { "prettier", stop_after_first = true },
        css = { "prettier", stop_after_first = true },
      },
      -- The options you set here will be merged with the builtin formatters.
      -- You can also define any custom formatters here.
      ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
      formatters = {
        injected = { options = { ignore_errors = true } },
      },
    }

    return opts
  end,
}
