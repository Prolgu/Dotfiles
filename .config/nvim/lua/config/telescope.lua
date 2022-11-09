local telescope = require('telescope')
local actions = require('telescope.actions')
local previewers = require('telescope.previewers')

telescope.setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = '> ',
    selection_caret = "> ",
    use_less = false,
    set_env = { ['COLORTERM'] = 'truecolor' },
    border = {},
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    file_previewer   = previewers.vim_buffer_cat.new,
    grep_previewer   = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    buffer_previewer_maker = previewers.buffer_previewer_maker,

    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
        ["<C-u>"] = false,
      },
    }
  },
  extensions = {
    fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
    }
  },
  pickers={
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
    },
  },
}

-- telescope.load_extension('fzy_native')
-- telescope.load_extension("projectionist")
-- telescope.load_extension("file_browser")

local M = {}

M.search_config = function()
	require("telescope.builtin").git_files({
		prompt_title = "< dotfiles >",
		cwd = "$HOME/.dotfiles",
	})
end

M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

M.branches = function()
    require'telescope.builtin'.git_branches({ attach_mappings = function(_, map)
      map('i', '<c-j>', actions.git_create_branch)
      map('n', '<c-j>', actions.git_create_branch)
      return true
    end})
end

-- M.laravel_artisan = require('alpha.telescope_laravel').artisan

M.grep_string = function ()
    vim.ui.input("Grep for > ", function (input)
      if input == nil then
        return
      end
      require('telescope.builtin').grep_string({ search = input})
    end)
end


return M

