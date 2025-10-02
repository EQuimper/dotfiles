return {
  {
    "folke/snacks.nvim",
    opts = {
      images = {
        enabled = true,
        backend = "kitty",
        tmux_write_delay = 100,
      },
      picker = {
        hidden = true, -- for hidden files
        ignored = false, -- for .gitignore files
      },
      files = {
        hidden = true,
      },
      scroll = {
        enabled = false,
      },
    },
  },
}
