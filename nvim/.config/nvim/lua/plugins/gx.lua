return {
  "chrishrb/gx.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "gx",
      function()
        require("gx").open()
      end,
      mode = { "n", "x" },
      desc = "Open the target under cursor with gx.nvim",
    },
  },
  config = function()
    require("gx").setup()
  end,
}
