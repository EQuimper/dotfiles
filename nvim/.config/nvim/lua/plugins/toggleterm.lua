return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<C-\>]], -- ctrl + backslash to toggle
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float", -- other options: 'vertical', 'horizontal', 'tab'
        float_opts = {
          border = "curved",
          winblend = 0,
        },
      })
    end,
  },
}
