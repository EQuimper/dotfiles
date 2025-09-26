return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require("claude-code").setup()
  end,
  init = function()
    vim.keymap.set("n", "<leader>cv", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude Code" })
  end,
}
