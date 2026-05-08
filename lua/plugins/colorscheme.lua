-- Day/night theme: reads ~/.config/theme-mode (set by ~/.local/bin/theme).
-- Day  → solarized.nvim (light, sepia bg)
-- Night → gruvbox.nvim (dark, warm bg)

local function read_mode()
  local f = io.open(vim.fn.expand("~/.config/theme-mode"), "r")
  if not f then return "day" end
  local line = (f:read("*l") or "day"):gsub("%s+", "")
  f:close()
  return (line == "night") and "night" or "day"
end

local function apply_light_overrides()
  local bg_main = "NONE"        -- inherit kitty's #fdf6e3 exactly
  local bg_soft = "#eee8d5"
  local fg_dim  = "#93a1a1"
  local accent  = "#b58900"
  local sel     = "#d9d2b8"
  vim.api.nvim_set_hl(0, "Normal",       { bg = bg_main })
  vim.api.nvim_set_hl(0, "NormalNC",     { bg = bg_main })
  vim.api.nvim_set_hl(0, "SignColumn",   { bg = bg_main })
  vim.api.nvim_set_hl(0, "EndOfBuffer",  { bg = bg_main, fg = bg_main })
  vim.api.nvim_set_hl(0, "NormalFloat",  { bg = bg_soft })
  vim.api.nvim_set_hl(0, "FloatBorder",  { bg = bg_soft, fg = fg_dim })
  vim.api.nvim_set_hl(0, "Pmenu",        { bg = bg_soft })
  vim.api.nvim_set_hl(0, "PmenuSel",     { bg = sel, fg = "NONE" })
  vim.api.nvim_set_hl(0, "CursorLine",   { bg = bg_soft })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = accent, bold = true, bg = bg_soft })
  vim.api.nvim_set_hl(0, "LineNr",       { fg = fg_dim })
end

local function apply_dark_overrides()
  local bg_main = "NONE"
  local bg_soft = "#32302f"
  local bg_line = "#3c3836"
  local fg_dim  = "#a89984"
  vim.api.nvim_set_hl(0, "Normal",       { bg = bg_main })
  vim.api.nvim_set_hl(0, "NormalNC",     { bg = bg_main })
  vim.api.nvim_set_hl(0, "SignColumn",   { bg = bg_main })
  vim.api.nvim_set_hl(0, "EndOfBuffer",  { bg = bg_main, fg = bg_main })
  vim.api.nvim_set_hl(0, "NormalFloat",  { bg = bg_soft })
  vim.api.nvim_set_hl(0, "FloatBorder",  { bg = bg_soft, fg = fg_dim })
  vim.api.nvim_set_hl(0, "Pmenu",        { bg = bg_soft })
  vim.api.nvim_set_hl(0, "PmenuSel",     { bg = bg_line })
  vim.api.nvim_set_hl(0, "CursorLine",   { bg = bg_line })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#fabd2d", bold = true })
  vim.api.nvim_set_hl(0, "LineNr",       { fg = fg_dim })
end

return {
  { "maxmx03/solarized.nvim",   lazy = false, priority = 1000 },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 999,
    config = function()
      require("solarized").setup({
        transparent = { enabled = false },
        styles = { comments = { italic = true }, keywords = { bold = false } },
      })
      require("gruvbox").setup({
        contrast = "soft",
        italic = { strings = false, comments = true },
      })

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function(args)
          if args.match == "solarized" then
            apply_light_overrides()
          elseif args.match == "gruvbox" then
            apply_dark_overrides()
          end
        end,
      })

      vim.opt.cursorline = true

      -- :ThemeReload — re-read state file and swap. Called by ~/.local/bin/theme via socket.
      vim.api.nvim_create_user_command("ThemeReload", function()
        local mode = read_mode()
        if mode == "night" then
          vim.o.background = "dark"
          vim.cmd.colorscheme("gruvbox")
        else
          vim.o.background = "light"
          vim.cmd.colorscheme("solarized")
        end
      end, {})

      vim.cmd("ThemeReload")
    end,
  },
}
