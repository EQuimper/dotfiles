return {
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/neotest-jest", "olimorris/neotest-phpunit" },
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        })
      )

      table.insert(
        opts.adapters,
        require("neotest-phpunit")({
          phpunit_cmd = function()
            return "vendor/bin/phpunit"
          end,
        })
      )
    end,
  },
}
