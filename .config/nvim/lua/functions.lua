--  vim: set fenc=utf-8 ts=2 sw=2 sts=2 sr et si tw=120 fdm=expr fmr={{{,}}}:

--
-- Custom Lua functions
--
local opt = vim.opt
local api = vim.api
local fn = vim.fn
local cmd = vim.cmd
local u_cmd = vim.api.nvim_create_user_command
local flt_str = 'FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center '

-- Modeline {{{

-- Generate modeline {{{

local customModelineElements = "" -- Store some modeline elements to be added by other sources

local function generateModeline()
  local commentString = opt.commentstring:get() -- Get commentstring for current filetype
  local spaceIfNeeded = ""
  local fileencoding

  -- Use UTF-8 if no fileencoding is set
  if (opt.fileencoding:get() == "") then
    fileencoding = "utf-8"
  else
    fileencoding = opt.fileencoding:get()
  end

  -- Insert space at the end of the modeline if commentstring is a blockcomment
  if (string.match(commentString, "%%s(.*)") ~= "") then
    spaceIfNeeded = " "
  end

  local modelineElements = -- Settings to save inside the modeline
  {
    " vim: set",
    " fenc=" .. fileencoding,
    " ts=" .. opt.tabstop:get(),
    " sw=" .. opt.shiftwidth:get(),
    " sts=" .. opt.softtabstop:get(),
    " sr",
    " et",
    " si",
    " tw=" .. opt.textwidth:get(),
    " fdm=" .. opt.foldmethod:get(),
    " fmr=" .. opt.foldmarker:get()[1] .. "," .. opt.foldmarker:get()[2],
    customModelineElements,
    ":",
    spaceIfNeeded,
  }

  local modelineConcat = table.concat(modelineElements) -- Concatenate the table values
  local modeline       = commentString:gsub("%%s", modelineConcat) -- Place modeline in commentstring correctly

  return modeline
end

-- Insert modeline in buffer {{{

u_cmd('AppendModeline', function()

  local modeline    = generateModeline() -- Generate modeline
  local buffer      = api.nvim_win_get_buf(0) -- Get current buffer
  local currentLine = api.nvim_buf_get_lines(buffer, 0, 1, true)[1] -- Get current first line to check

  if (currentLine == modeline) then
    -- if modeline exists
    print("Modeline existente.")

  elseif (string.match(currentLine, "vim:")) then
    -- if different modeline exists
    api.nvim_buf_set_lines(0, 0, 1, true, { modeline })
    print("Modeline editada.")

  else
    -- if modeline doesn't exist
    api.nvim_buf_set_lines(0, 0, 0, true, { modeline })
    print("Modeline insertada.")
  end
end, {})

-- }}}

-- }}}

-- }}}


-- Get half of horizontal screen size {{{
GetHalfColumnSize = function()
  local size     = opt.columns:get()
  local halfSize = math.floor(size / 2)
  return halfSize
end

-- }}}


Menu = function()
  vim.ui.input({ prompt = "No se que: ", completion = "file" }, function(input)
    vim.cmd("redraw")
    if input == "" then
      print("Debe ingresar opcion!")
    else
      print(input)
    end
  end)
end



-- to save terminals
-- list_of_terms = {}

-- Terminal = function(nr, ...)
--   -- if the terminal with nr exists, set the current buffer to it
--   if list_of_terms[nr] then
--     -- change to the terminal
--     vim.api.nvim_set_current_buf(list_of_terms[nr])
--     -- if the terminal doesn't exist
--   else
--     -- create a buffer that's is unlisted and not a scratch buffer
--     local buf = vim.api.nvim_create_buf(true, false)
--     -- change to that buffer
--     vim.api.nvim_set_current_buf(buf)
--     -- create a terinal in the new buffer using my favorite shell
--     -- vim.api.nvim_call_function("termopen", { "/bin/zsh" })
--     vim.fn.termopen('/bin/zsh', { on_exit = function()
--       vim.api.nvim_command('bdelete!')
--     end })
--     -- save a reference to that buffer
--     list_of_terms[nr] = buf
--   end
--   -- change to insert mode
--   vim.api.nvim_command(":startinsert")
-- end


u_cmd('ShLS', function()
  cmd("ls")
end, { bang = true })


u_cmd('ShellCMD', function()
  cmd(flt_str .. "(bash)")
end, { nargs = 0 })

-- Clear search register {{{

u_cmd('ClearSearch', function()
  fn.setreg('/', {})
  print("Search cleared.")
end, { nargs = 0 })

-- }}}

-- Compiler runner{{{

u_cmd('Run', function()

  local bufftype = vim.bo.filetype

  if bufftype == 'c' then
    cmd(flt_str .. "(gcc % -o %< -llua && ./%<)")
  elseif bufftype == 'cpp' then
    cmd(flt_str .. "(g++ % -o %< -llua && ./%<)")
  elseif bufftype == 'python' then
    cmd(flt_str .. "(python %)")
  elseif bufftype == 'sh' then
    cmd(flt_str .. "(bash %)")
  elseif bufftype == 'lua' then
    cmd(flt_str .. "(lua %)")
  elseif bufftype == 'javascript' then
    cmd(flt_str .. "(node %)")
  elseif bufftype == 'rust' then
    cmd(flt_str .. "(rustc % && ./%<)")
  else
    print("Formato sin configurar")
  end

end, { nargs = 0 })

-- }}}

-- Shell {{{

u_cmd('Shell', function(opts)

  if opts.args == 'zsh' then
    cmd(flt_str .. "(zsh)")
  elseif opts.args == 'py' then
    cmd(flt_str .. "(python)")
  elseif opts.args == 'bash' then
    cmd(flt_str .. "(bash)")
  elseif opts.args == 'lua' then
    cmd(flt_str .. "(lua)")
  else
    print("Argumento incorrecto")
  end

end, { nargs = 1, complete = function()
  return { 'bash', 'zsh', 'py', 'lua' }
end, })

-- }}}

-- Clear all registers {{{

u_cmd('ClearAllRegisters', function()
  local registers = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"*+'

  registers:gsub('.', function(register) -- take all chars and run them against the command
    fn.setreg(register, {})
  end)

  print("All registers have been cleared.")
end, {})

-- }}}

-- Clear all marks {{{

u_cmd('ClearAllMarks', function()
  cmd [[ delmarks! | delmarks a-zA-Z0-9 ]]
  print("All marks have been cleared.")
end, {})

-- }}}

-- Calc {{{

local mathEval = function(exp)
  return load("return " .. exp, exp, "t", math)()
end

u_cmd('Calc', function()
  vim.ui.input({ prompt = "Ingrese expresion -> " }, function(input)
    if input ~= nil then
      vim.cmd("redraw")
      print('Resultado:', mathEval(input))
      -- else
      --   print("Debe ingresar opcion!")
    end
  end)
end, {})

-- }}}

-- Insert Template {{{

u_cmd('InsertTemplate', function(opts)

  local path = "~/.config/nvim/templates/"
  local signature = "Matias Bonina"

  if opts.args == 'sh' then
    path = path .. "sh.template"
  elseif opts.args == 'py' then
    path = path .. "py.template"
  elseif opts.args == 'tex' then
    path = path .. "tex.template"
  else
    print("Error!")
  end

  cmd('0r ' .. path)
  cmd("%s/{{YEAR}}/\\=strftime('%Y')/ge")
  cmd("%s/{{DATE}}/\\=strftime('%a %d %b %Y')/ge")
  cmd("%s/{{TITLE}}/\\=expand('%:t')/ge")
  cmd("%s/{{NAME}}/" .. signature .. "/ge")
  cmd("%s/{{HERE}}/" .. "")

  cmd("redraw")

end, { nargs = 1, complete = function()
  return { 'sh', 'py', 'tex' }
end, })

-- }}}

u_cmd('', function()

end, { nargs = 0 })

u_cmd('', function()

end, { nargs = 0 })

u_cmd('', function()

end, { nargs = 0 })

u_cmd('', function()

end, { nargs = 0 })

-- Multiple Functions {{{

local function get_first_terminal()
  local terminal_chans = {}

  for _, chan in pairs(vim.api.nvim_list_chans()) do
    if chan["mode"] == "terminal" and chan["pty"] ~= "" then
      table.insert(terminal_chans, chan)
    end
  end

  table.sort(terminal_chans, function(left, right)
    return left["buffer"] < right["buffer"]
  end)

  return terminal_chans[1]["id"]
end

SendToTerm = function()
  -- vim.api.nvim_chan_send(vim.bo.channel, input)
  vim.ui.input({ prompt = "No se que: " }, function(input)
    vim.api.nvim_chan_send(get_first_terminal(), input .. "\r")
  end)
end

function show_region_marks_and_lines(buffer)
  buffer = buffer or 0 -- default: current buffer
  local start_tbl = vim.api.nvim_buf_get_mark(buffer, '<')
  local end_tbl = vim.api.nvim_buf_get_mark(buffer, '>')
  print('v. 08')
  print('start mark:')
  for i, v in ipairs(start_tbl) do
    print('    ', i, v)
  end
  print('end mark:')
  for i, v in ipairs(end_tbl) do
    print('    ', i, v)
  end
  local start_line = start_tbl[1] - 1
  local start_col = start_tbl[2]
  local end_line = end_tbl[1]
  local end_col = end_tbl[2]
  local range_tbl = vim.api.nvim_buf_get_lines(buffer, start_line, end_line, true)
  -- If start_col > 0 or end_col < 100000, then it's a per character
  -- (character-wise) visual mode selection/range.
  -- So, adjust the first and last line.
  -- I do not know how to find out if it's a block-wise (rectangular) selection.
  if start_col > 0 then
    range_tbl[1] = string.sub(range_tbl[1], start_col + 1)
  end
  if end_col < 100000 then
    range_tbl[#range_tbl] = string.sub(range_tbl[#range_tbl], 1, end_col)
  end
  -- print('range/selection:')
  for i, v in ipairs(range_tbl) do
    -- print('    ', string.format('%2d |%s|', i, v))
    print(v)
  end
end

FuzzySearch = function()
  local width = vim.o.columns - 4
  local height = 11
  if (vim.o.columns >= 85) then
    width = 80
  end
  vim.api.nvim_open_win(
    vim.api.nvim_create_buf(false, true),
    true,
    {
      relative = 'editor',
      style = 'minimal',
      -- border = 'shadow',
      noautocmd = true,
      width = width,
      height = height,
      col = math.min((vim.o.columns - width) / 2),
      row = math.min((vim.o.lines - height) / 2 - 1),
    }
  )
  local file = vim.fn.tempname()
  -- vim.fn.termopen('find . -type f | fzf > ' .. file, { on_exit = function()
  vim.fn.termopen('ls ~/.config/nvim/templates | fzf >' .. file, { on_exit = function()
    vim.api.nvim_command('bdelete!')
    local f = io.open(file, 'r')
    local stdout = f:read('*all')
    f:close()
    os.remove(file)
    vim.api.nvim_command('edit ' .. stdout)
  end })
end

TemplateSelector = function()
  local width = vim.o.columns - 4
  local height = 10
  if (vim.o.columns >= 85) then
    width = 30
  end
  vim.api.nvim_open_win(
    vim.api.nvim_create_buf(false, true),
    true,
    {
      relative = 'editor',
      -- style = 'minimal',
      border = 'none',
      noautocmd = true,
      width = width,
      height = height,
      col = math.min((vim.o.columns - width) / 2),
      row = math.min((vim.o.lines - height) / 2),
    }
  )
  local file = vim.fn.tempname()
  -- vim.fn.termopen('find . -type f | fzf > ' .. file, { on_exit = function()
  vim.fn.termopen('ls ~/.config/nvim/templates | fzf >' .. file, { on_exit = function()
    vim.api.nvim_command('bdelete!')
    local f = io.open(file, 'r')
    local stdout = f:read('*all')
    f:close()
    os.remove(file)
    vim.api.nvim_command('edit ' .. stdout)
  end })
end

-- }}}
