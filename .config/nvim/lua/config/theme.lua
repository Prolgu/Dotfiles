require('onedark').setup  {
  -- Main options --
  style = 'deep', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  transparent = true,  -- Show/hide background
  term_colors = true, -- Change terminal color as per the selected theme style
  ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
  -- toggle theme style ---
  toggle_style_key = '<leader>ts', -- Default keybinding to toggle
  toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

  -- Change code style ---
  -- Options are italic, bold, underline, none
  -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
  code_style = {
    comments = 'italic',
    keywords = 'bold',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },

  -- Custom Highlights --
  -- colors = {
    -- bright_orange = "#ff8800",    -- define a new color
    -- light_green = '#00ffaa',            -- redefine an existing color
    -- white='#fffff'
  -- }, -- Override default colors
  -- highlights = {
    -- TSKeyword = {fg = '$bright_orange'},
    -- TSVariable = {fg = '$white'},
    -- TSComment = {fg = '$white'},
    -- TSString = {fg = '$bright_orange', bg = '#00ff00', fmt = 'bold'},
    -- TSString = {fg = '$green'},
    -- TSFunction = {fg = '#0000ff', sp = '$cyan'},
  -- }, -- Override highlight groups

  -- Plugins Config --
  diagnostics = {
    darker = true, -- darker colors for diagnostic
    undercurl = true,   -- use undercurl instead of underline for diagnostics
    background = false,    -- use background color for virtual text
  },
}

-- vim.cmd("colorscheme rvcs")
-- vim.cmd("colorscheme dracula")
-- require('moonlight').set()
require('monokai').setup { palette = require('monokai') }
-- vim.cmd("colorscheme onedark")
-- vim.cmd("colorscheme gruvbox")

-- VSCode
-- vim.cmd("colorscheme vscode")
-- vim.g.vscode_style= "dark"
-- vim.g.vscode_transparent= 1
-- vim.g.vscode_italic_comment= 1
-- vim.g.vscode_disable_nvimtree_bg= true

-- vim.cmd("colorscheme ayu")
-- require('ayu').setup({
--   mirage = true,
--   overrides = {
--     line = '#54658C'
--   },
-- })
 -- line = "#191E2A",
