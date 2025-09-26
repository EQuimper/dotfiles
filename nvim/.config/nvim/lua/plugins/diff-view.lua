return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" }, -- Lazy-load on these commands
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- Optional for file icons
    },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
      { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
    },
    opts = {
      diff_binaries = false,
      enhanced_diff_hl = false,
      use_icons = true, -- Requires devicons
      view = {
        default = { layout = "diff2_horizontal" },
        merge_tool = { layout = "diff3_horizontal" },
      },
      file_panel = {
        listing_style = "tree",
        win_config = { position = "left", width = 35 },
      },
      keymaps = {
        disable_defaults = false, -- Keep plugin's default keymaps
      },
    },
  },
}
