local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
    prompt_prefix = "🔍 ",
    selection_caret = "❯ ",
    file_ignore_patterns = {
      "node_modules/.*",
      "%.git/.*",
      "dist/.*",
      "build/.*",
      "%.png",
      "%.jpg",
      "%.jpeg",
    },
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    mappings = {
      n = {
        ["q"] = actions.close,
        ["<C-c>"] = actions.close,
      },
      i = {
        ["<C-c>"] = actions.close,
      },
    },
    -- Avoid crashing when treesitter parser helpers are missing.
    preview = {
      treesitter = false,
    },
  },
  -- pickers = {
  --   find_files = {
  --     find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
  --   },
  -- },
  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

telescope.load_extension("file_browser")

vim.keymap.set('n', 'ff',
  function()
    builtin.find_files({
      file_ignore_patterns = {
        "node%_modules/.*",
        "%.git/.*",
        "dist/.*",
        "build/.*",
        "%.png",
        "%.jpg",
        "%.jpeg",
      },
      -- no_ignore = false,
      hidden = true
    })
  end)
-- vim.keymap.set('n', 'ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', 'fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', 'fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', 'fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set("n", "fe", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = true,
    initial_mode = "normal",
  })
end)
