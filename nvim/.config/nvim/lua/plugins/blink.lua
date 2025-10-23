return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    -- 1) don't show popup automatically
    opts.completion = vim.tbl_deep_extend("force", opts.completion or {}, {
      menu = { auto_show = false }, -- only show when you ask
    })

    -- 2) manual trigger & close for the menu
    opts.keymap = vim.tbl_deep_extend("force", opts.keymap or {}, {
      preset = opts.keymap and opts.keymap.preset or "default",
      ["<C-Space>"] = { "show" }, -- open completion menu on demand
      ["<C-e>"] = { "hide" }, -- close menu
      -- ensure blink doesn't steal <S-Tab> (we'll use it for Copilot)
      ["<S-Tab>"] = { "fallback" },
    })

    return opts
  end,
  -- opts = {
  --   completion = {
  --     accept = {
  --       auto_brackets = {
  --         enabled = true,
  --       },
  --     },
  --     menu = {
  --       auto_show = false, -- Don't show menu automatically, only ghost text
  --     },
  --     documentation = {
  --       auto_show = false,
  --     },
  --     ghost_text = {
  --       enabled = true,
  --     },
  --   },
  --   keymap = {
  --     ["<C-Space>"] = { "show" },
  --     ["<C-@>"] = { "show" },
  --     -- Tab: Navigate menu
  --     ["<Tab>"] = { "select_next", "fallback" },
  --     -- ["<S-Tab>"] = { "accept", "fallback" },
  --     ["<CR>"] = { "accept", "fallback" },
  --   },
  --   sources = {
  --     default = { "lsp", "path", "snippets", "buffer", "copilot" },
  --     providers = {
  --       copilot = {
  --         name = "copilot",
  --         module = "blink-cmp-copilot",
  --         kind = "Copilot",
  --         score_offset = 100,
  --         async = true,
  --         transform_items = function(_, items)
  --           local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
  --           local kind_idx = #CompletionItemKind + 1
  --           CompletionItemKind[kind_idx] = "Copilot"
  --           for _, item in ipairs(items) do
  --             item.kind = kind_idx
  --           end
  --           return items
  --         end,
  --       },
  --     },
  --   },
  --   appearance = {
  --     -- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
  --     kind_icons = {
  --       Copilot = "",
  --       Text = "󰉿",
  --       Method = "󰊕",
  --       Function = "󰊕",
  --       Constructor = "󰒓",
  --
  --       Field = "󰜢",
  --       Variable = "󰆦",
  --       Property = "󰖷",
  --
  --       Class = "󱡠",
  --       Interface = "󱡠",
  --       Struct = "󱡠",
  --       Module = "󰅩",
  --
  --       Unit = "󰪚",
  --       Value = "󰦨",
  --       Enum = "󰦨",
  --       EnumMember = "󰦨",
  --
  --       Keyword = "󰻾",
  --       Constant = "󰏿",
  --
  --       Snippet = "󱄽",
  --       Color = "󰏘",
  --       File = "󰈔",
  --       Reference = "󰬲",
  --       Folder = "󰉋",
  --       Event = "󱐋",
  --       Operator = "󰪚",
  --       TypeParameter = "󰬛",
  --     },
  --   },
  -- },
}
