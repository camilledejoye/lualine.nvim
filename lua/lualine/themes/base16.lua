local function setup(colors)
  local theme = {
    normal = {
      a = { fg = colors.bg, bg = colors.normal },
      b = { fg = colors.light_fg, bg = colors.alt_bg },
      c = { fg = colors.fg, bg = colors.bg },
    },
    replace = {
      a = { fg = colors.bg, bg = colors.replace },
      b = { fg = colors.light_fg, bg = colors.alt_bg },
    },
    insert = {
      a = { fg = colors.bg, bg = colors.insert },
      b = { fg = colors.light_fg, bg = colors.alt_bg },
    },
    visual = {
      a = { fg = colors.bg, bg = colors.visual },
      b = { fg = colors.light_fg, bg = colors.alt_bg },
    },
    inactive = {
      a = { fg = colors.dark_fg, bg = colors.bg },
      b = { fg = colors.dark_fg, bg = colors.bg },
      c = { fg = colors.dark_fg, bg = colors.bg },
    },
  }

  theme.command = theme.normal
  theme.terminal = theme.insert

  return theme
end

local function setup_default()
  return setup {
    bg       = '#282a2e',
    alt_bg   = '#373b41',
    dark_fg  = '#969896',
    fg       = '#b4b7b4',
    light_fg = '#c5c8c6',
    normal   = '#81a2be',
    insert   = '#b5bd68',
    visual   = '#b294bb',
    replace  = '#de935f',
  }
end

local function setup_base16()
  local loaded, base16 = pcall(require, 'base16-colorscheme')

  if not loaded then
    return nil
  end

  -- base16.colors might not be defined yet depending on the plugins' sequencing
  local colors = base16.colors or base16.colorschemes[vim.env.BASE16_THEME or 'tomorrow-night']

  return setup {
    bg        = colors.base01,
    alt_bg    = colors.base02,
    dark_fg   = colors.base03,
    fg        = colors.base04,
    light_fg  = colors.base05,
    normal    = colors.base0D,
    insert    = colors.base0B,
    visual    = colors.base0E,
    replace   = colors.base09,
  }
end

return setup_base16() or setup_default()
