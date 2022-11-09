local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

-- function lspStatus()
--   local error_count = vim.lsp.diagnostic.get_count(0, 'Error')
--   local warning_count = vim.lsp.diagnostic.get_count(0, 'Warning')
--   return 'W: ' .. warning_count .. ' E: ' .. error_count
-- end
-- lualine.sections.lualine_a = { 'mode', { 'diagnostics', sources = { 'coc', 'ale' }}

-- Color for highlights
local colors = {
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67'
}

local diagnostics = {
	"diagnostics",
	sources = { 'nvim_lsp','coc','ale'},
	sections = { "error", "warn","hint" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

-- NOTE: asd
-- FIXME: asd
-- TODO: qwe
-- NOTE: 2022-03-03
lualine.setup({
	options = {
    globalstatus=false,
		icons_enabled = true,
		theme = "onedark",
		-- theme = "onedark",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch,diagnostics},
		-- lualine_c = {'lsp_progress'},
		lualine_c = {},
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		-- lualine_x = { diff, spaces, "encoding", filetype },
		lualine_x = { diff },
		-- lualine_y = { diff,  "encoding" },
		lualine_y = { '' },
		lualine_z = { 'filename' },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {''},
		lualine_z = {''},
	},
	tabline = {},
	extensions = {'symbols-outline','quickfix','toggleterm','nvim-tree'},
})

-- require('lualine').setup{
--     options = {
--       theme = 'dracula',
--       icons_enabled = true,
--     },
--     extensions = {'quickfix', 'fugitive'},
--     sections = {
--       lualine_a = { { 'mode', upper = true } },
--       lualine_b = { { 'branch', icon = '' }, 'diff' },
--       lualine_c = { { 'filename', file_status = true, path = 1 } },
--       lualine_x = { { 'diagnostics', sources = { 'nvim_diagnostic' } },'encoding', 'fileformat', 'filetype' },
--       lualine_y = { 'progress' },
--       lualine_z = { 'location' },
--     },
--     inactive_sections = {
--       lualine_a = {  },
--       lualine_b = {  },
--       lualine_c = { 'filename' },
--       lualine_x = { 'location' },
--       lualine_y = {  },
--       lualine_z = {  },
--     },
--     -- tabline = {
--     --   lualine_a = {'buffers'},
--     --   lualine_b = {},
--     --   lualine_c = {},
--     --   lualine_x = {},
--     --   lualine_y = {},
--     --   lualine_z = {'tabs'}
--     -- }
--     }
