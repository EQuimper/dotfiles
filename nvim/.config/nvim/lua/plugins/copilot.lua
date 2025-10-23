return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    config = function()
      -- Set explicit Node path for Copilot to avoid version conflicts
      vim.g.copilot_node_command = vim.fn.expand("~/.local/share/fnm/node-versions/v22.14.0/installation/bin/node")

      require("copilot").setup({})
    end,
    event = "BufReadPost",
    opts = {
      suggestion = {
        enabled = not vim.g.ai_cmp,
        auto_trigger = true,
        hide_during_completion = vim.g.ai_cmp,
        keymap = {
          accept = "<S-Tab>",
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = true, auto_trigger = true }, -- ghost text on
        panel = { enabled = false },
      })

      -- Accept Copilot ghost text with Shift+Tab
      vim.keymap.set("i", "<S-Tab>", function()
        local ok, s = pcall(require, "copilot.suggestion")
        if ok and s.is_visible() then
          s.accept()
          return ""
        end
        return "<S-Tab>" -- normal behavior if no suggestion
      end, { expr = true, silent = true, desc = "Accept Copilot suggestion" })
    end,
  },
  {
    "giuxtaposition/blink-cmp-copilot",
  },
}
