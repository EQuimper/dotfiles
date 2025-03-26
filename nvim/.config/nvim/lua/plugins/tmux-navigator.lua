return {
  "christoomey/vim-tmux-navigator",
  event = "VimEnter",
  keys = {
    { "<c-h>", "<cmd><C-h>TmuxNavigateLeft<cr>" },
    { "<c-j>", "<cmd><C-j>TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd><C-k>TmuxNavigateUp<cr>" },
    { "<c-l>", "<cmd><C-l>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
}
