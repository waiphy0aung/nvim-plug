return {
  {
    "jpwol/thorn.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("thorn").setup()
      vim.cmd.colorscheme("thorn-dark-warm")
    end,
  },
}
