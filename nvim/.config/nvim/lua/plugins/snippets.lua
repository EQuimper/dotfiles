return {
  {
    "L3MON4D3/LuaSnip",
    opts = {
      -- Optional: clear existing snippets before loading yours
      delete_check_events = "TextChanged", -- this helps with reloads
    },
    config = function(_, opts)
      require("luasnip").config.set_config(opts)

      -- Load JSON snippets from your custom path
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { "~/.config/nvim/snippets" },
      })
    end,
  },
  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },
}
