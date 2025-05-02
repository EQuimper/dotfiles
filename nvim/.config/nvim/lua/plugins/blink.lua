return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      accept = {
        auto_brackets = {
          enabled = false,
        },
      },
      documentation = {
        auto_show = false,
      },
      -- menu = {
      --   auto_show = false,
      -- },
    },
    keymap = {
      -- ["<Tab>"] = {
      --   function(cmp)
      --     if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then
      --       return cmp.accept()
      --     end
      --   end,
      --   "show_and_insert",
      -- },
      ["<CR>"] = { "accept", "fallback" },
      -- ["<C-j>"] = { "select_next", "fallback" },
      -- ["<C-k>"] = { "select_prev", "fallback" },
    },
  },
}
