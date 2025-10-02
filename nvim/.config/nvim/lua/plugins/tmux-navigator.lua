return {
  "christoomey/vim-tmux-navigator",
  event = "VimEnter",
  keys = {
    {
      "<c-h>",
      "<cmd>TmuxNavigateLeft<cr>",
      mode = { "n", "t" },
      desc = "Move to left tmux pane",
    },
    {
      "<c-j>",
      "<cmd>TmuxNavigateDown<cr>",
      mode = { "n", "t" },
      desc = "Move to lower tmux pane",
    },
    {
      "<c-k>",
      "<cmd>TmuxNavigateUp<cr>",
      mode = { "n", "t" },
      desc = "Move to upper tmux pane",
    },
    {
      "<c-l>",
      "<cmd>TmuxNavigateRight<cr>",
      mode = { "n", "t" },
      desc = "Move to right tmux pane",
    },
    {
      "<c-\\>",
      "<cmd>TmuxNavigatePrevious<cr>",
      mode = { "n", "t" },
      desc = "Move to previous tmux pane",
    },
  },
}
