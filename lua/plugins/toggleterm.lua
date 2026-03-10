return {
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<C-t>", '<Cmd>execute v:count . "ToggleTerm"<CR>', desc = "Toggle terminal", silent = true },
      { "<C-t>", "<Esc><Cmd>ToggleTerm<CR>", mode = "t", desc = "Toggle terminal", silent = true },
    },
    cmd = "ToggleTerm",
    config = function()
      require("toggleterm").setup({
        size = 50,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = "1",
        start_in_insert = true,
        persist_size = true,
        direction = "horizontal",
      })

      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })
    end,
  },
}
