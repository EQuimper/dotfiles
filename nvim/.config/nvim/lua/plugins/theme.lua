return {
  -- {
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     style = "moon",
  --     -- transparent = true,
  --     styles = {
  --       -- sidebars = "transparent",
  --       -- floats = "transparent",
  --     },
  --   },
  --   init = function()
  --     vim.cmd.colorscheme("tokyonight-night")
  --     vim.cmd.hi("Comment gui=none")
  --     vim.cmd.hi("VM_Mono guibg=Grey60 guifg=Black gui=NONE")
  --     vim.cmd.hi("VM_Cursor guibg=Grey60 guifg=Black gui=NONE")
  --   end,
  -- },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "macchiato",
      transparent_background = true,
      integrations = {
        aerial = true,
        alpha = true,
        bufferline = false, -- Disable bufferline integration to avoid the error
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false, -- Disable bufferline entirely to avoid the error
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
