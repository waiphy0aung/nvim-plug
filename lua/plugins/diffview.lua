return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git diff view" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File git history" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch git history" },
    },
    opts = {},
  },
}
