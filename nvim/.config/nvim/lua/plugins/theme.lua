return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    init = function()
      vim.cmd.colorscheme("tokyonight-night")
      vim.cmd.hi("Comment gui=none")
      vim.cmd.hi("VM_Mono guibg=Grey60 guifg=Black gui=NONE")
      vim.cmd.hi("VM_Cursor guibg=Grey60 guifg=Black gui=NONE")
    end,
  },
}
