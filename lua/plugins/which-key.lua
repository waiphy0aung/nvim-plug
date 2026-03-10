return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({
        delay = 300,
        icons = {
          separator = "->",
        },
      })
      wk.add({
        { "<leader>c", group = "Code" },
        { "<leader>f", desc = "Format (async)" },
        { "<leader>h", desc = "Clear highlight" },
        { "<leader>r", group = "Refactor" },
        { "<leader>s", group = "Signature" },
        { "<leader>w", group = "Workspace" },
        { "<leader>D", desc = "Type definition" },
        { "f", group = "Find" },
        { "g", group = "Go to" },
        { "s", group = "Split" },
        { "t", group = "Toggle" },
      })
    end,
  },
}
