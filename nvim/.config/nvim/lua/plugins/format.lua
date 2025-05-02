return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft["typescript"] = { "prettier", stop_after_first = true }
    opts.formatters_by_ft["typescriptreact"] = { "prettier", stop_after_first = true }
    opts.formatters_by_ft["javascript"] = { "prettier", stop_after_first = true }
    opts.formatters_by_ft["javascriptreact"] = { "prettier", stop_after_first = true }
    opts.formatters_by_ft["json"] = { "prettier", stop_after_first = true }
    opts.formatters_by_ft["html"] = { "prettier", stop_after_first = true }
    opts.formatters_by_ft["css"] = { "prettier", stop_after_first = true }
    opts.formatters_by_ft["yaml"] = { "prettier", stop_after_first = true }
    opts.formatters_by_ft["blade"] = { "blade-formatter", stop_after_first = true }
  end,
}
