local parsers = { "c", "lua", "rust", "ruby", "vim", "javascript", "typescript", "tsx", "html", "css" }

local function install_parsers()
  local installed = require("nvim-treesitter.config").get_installed()
  local to_install = vim.tbl_filter(function(p)
    return not vim.list_contains(installed, p)
  end, parsers)
  if #to_install > 0 then
    require("nvim-treesitter.install").install(to_install, { summary = true })
  end
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      install_parsers()
    end,
    lazy = false,
    config = function()
      require("nvim-treesitter").setup()
      install_parsers()

      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },
}
