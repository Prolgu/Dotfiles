require('nvim-web-devicons').setup {
  -- your personnal icons can go here (to override)
  -- DevIcon will be appended to `name`
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  override = {
    zsh = {
      icon = "",
      color = "#428850",
      name = "Zsh"
    },
    vim = {
      icon = "",
      color = "#428850",
      name = "Vim"
    },
    html = {
      icon = "",
      color = "#DE8C92",
      name = "html"
    },
    css = {
      icon = "",
      color = "#81A1C1",
      name = "css"
    },
    js = {
      icon = "",
      color = "#EBCB8B",
      name = "js"
    },
    png = {
      icon = " ",
      color = "#BD77DC",
      name = "png"
    },
    jpg = {
      icon = " ",
      color = "#BD77DC",
      name = "jpg"
    },
    jpeg = {
      icon = " ",
      color = "#BD77DC",
      name = "jpeg"
    },
    mp3 = {
      icon = "",
      color = "#C8CCD4",
      name = "mp3"
    },
    mp4 = {
      icon = "",
      color = "#C8CCD4",
      name = "mp4"
    },
    out = {
      icon = "",
      color = "#C8CCD4",
      name = "out"
    },
    toml = {
      icon = "",
      color = "#81A1C1",
      name = "toml"
    },
    lock = {
      icon = "",
      color = "#DE6B74",
      name = "lock"
    }

  };
  default = true;
}

local cls = {
  -- bg = '#282c34',
  bg = '#1B1D1E',
  bg_dark = '#232526',
  -- bg_dark='#1B1D1E',
  line_bg = '#353644',
  -- line_bg = '#232526',
  fg = '#8FBCBB',
  fg_green = '#65a380',

  yellow = '#f5bf0f',
  cyan = '#36a3d9',
  darkblue = '#081633',
  green = '#afd700',
  orange = '#FF8800',
  purple = '#5d4d7a',
  magenta = '#c678dd',
  blue = '#51afef';
  red = '#ec5f67'
}

require 'bufferline'.setup {
  options = {
    view = "multiwindow",
    show_buffer_close_icons = false,
    -- buffer_close_icon = '',
    buffer_close_icon = '',
    close_icon = '',
    max_name_length = 40,
    -- close_icon = '',
    tab_size = 10,
    modified_icon = '+',
    separator_style = { '', '' },
    always_show_bufferline = true, -- | false,
    -- numbers="buffer_id",
    -- number_style = "superscript",
    -- left_trunc_marker = '',
    -- right_trunc_marker = '',
    -- separator_icon=" ",
    -- left_trunc_marker = ' ',
    -- right_trunc_marker = ' ',
    -- separator_style = {"",""},--"thin", --| "thick" | "thin" | { 'any', 'any' },
    -- enforce_regular_tabs = false,-- | true,
  },

  highlights = {
    fill = {
      fg = cls.bg_dark,
      bg = cls.bg_dark
    },
    background = {
      fg = cls.green,
      bg = cls.bg_dark,
    },
    tab = {
      fg = cls.blue,
      bg = cls.bg_dark
    },
    tab_selected = {
      fg = cls.green,
      bg = cls.bg_dark,
      bold = true,
      italic = true
      -- gui = "bold,italic"

    },
    buffer_visible = {
      fg = cls.green,
      bg = cls.bg,
      bold = true
      -- gui = "bold"
    },
    buffer_selected = {
      fg = cls.green,
      bg = cls.bg,
      bold = true
      -- gui = "bold"
    },
    modified = {
      fg = cls.fg_green,
      bg = cls.bg_dark,
      bold = true
      -- gui = "bold"
    },
    modified_visible = {
      fg = cls.fg_green,
      bg = cls.bg_dark,
      bold = true
      -- gui = "bold"
    },
    modified_selected = {
      fg = cls.fg_green,
      bg = cls.bg,
      bold = true
      -- gui = "bold"
    },
    separator_selected = {
      fg = cls.bg_dark,
      bg = cls.bg_dark
    },
    separator_visible = {
      fg = cls.bg,
      bg = cls.bg
    },
    separator = {
      fg = cls.bg_dark,
      bg = cls.bg_dark -- Numbers
    },
    indicator_selected = {
      fg = cls.bg,
      bg = cls.bg
    },
    -- pick_selected = {
    --     guifg = error_fg,
    --     guibg = normal_bg,
    --     gui = "bold,italic"
    -- },
    -- pick_visible = {
    --     guifg = error_fg,
    --     guibg = visible_bg,
    --     gui = "bold,italic"
    -- },
    -- pick = {
    --     guifg = cls.bg,
    --     guibg = cls.red,
    --     gui = "bold,italic"
    -- },
    -- duplicate_selected = {
    --     guifg = duplicate_color,
    --     gui = "italic",
    --     guibg = normal_bg
    -- },
    -- duplicate_visible = {
    --     guifg = duplicate_color,
    --     gui = "italic",
    --     guibg = visible_bg
    -- },
    -- duplicate = {
    --     guifg = duplicate_color,
    --     gui = "italic",
    --     guibg = background_color
    -- },
  }
}



-- modified_visible = {
--     guifg = string_fg,
--     guibg = visible_bg
-- },
-- modified_selected = {
--     guifg = string_fg,
--     guibg = normal_bg
-- },
