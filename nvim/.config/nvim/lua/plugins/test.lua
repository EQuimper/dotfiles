return {
  { "nvim-neotest/neotest-plenary" },
  {
    "nvim-neotest/neotest",
    event = "LspAttach",
    dependencies = { "nvim-neotest/neotest-jest", "olimorris/neotest-phpunit", "nvim-treesitter/nvim-treesitter" },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}

      -- nvim 0.12 still ships vim.iter but neotest-jest falls back to the deprecated
      -- vim.tbl_flatten, which errors inside the async worker. Force the safe version.
      local compat = require("neotest-jest.compat")
      local jest_util = require("neotest-jest.jest-util")

      local function package_root(path)
        if not path or path == "" then
          return vim.fn.getcwd()
        end

        local start = path

        if vim.fn.isdirectory(start) == 0 then
          start = vim.fs.dirname(start)
        end

        local package_json = vim.fs.find("package.json", { path = start, upward = true })[1]

        if package_json then
          return vim.fs.dirname(package_json)
        end

        return vim.fn.getcwd()
      end

      local function package_jest_config(path)
        local root = package_root(path)
        local configs = {
          "custom.jest.config.ts",
          "jest.config.ts",
          "jest.config.js",
          "jest.config.mjs",
          "jest.config.cjs",
        }

        for _, filename in ipairs(configs) do
          local candidate = ("%s/%s"):format(root, filename)
          if vim.fn.filereadable(candidate) == 1 then
            return candidate
          end
        end

        return jest_util.getJestConfig(path)
      end
      if vim.fn.has("nvim-0.12.0") == 1 and vim.fn.has("nvim-0.13.0") == 0 then
        compat.tbl_flatten = function(tbl)
          return vim.iter(tbl):flatten():totable()
        end
      end

      table.insert(opts.adapters, require("neotest-plenary"))

      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = package_jest_config,
          env = { CI = true },
          cwd = function(path)
            -- Run Jest from the closest package.json so Turborepo packages pick
            -- up their own scripts/config instead of the workspace root.
            return package_root(path)
          end,
          -- Treat CRA/Next projects as Jest even without a direct dependency.
          isTestFile = function(file)
            if not file then
              return false
            end
            return require("neotest-jest.util").defaultTestFileMatcher(file)
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
