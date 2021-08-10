-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker

-- Local def {{{

local gl = require('galaxyline')
local gls = gl.section
local extension = require('galaxyline.provider_extensions')
-- local utils = require('utils')

--}}}

-- Definitions {{{
gl.short_line_list = {
    'LuaTree',
    'nvimtree',
    'coc-explorer',
    'vista',
    'dbui',
    'startify',
    'term',
    'nerdtree',
    'fugitive',
    'fugitiveblame',
    'plug'
}

-- let s:base0 = '#e6e1cf'
-- let s:base1 = '#e6e1cf'
-- let s:base2 = '#3e4b59'
-- let s:base3 = '#e6e1cf'
-- let s:base00 = '#14191f'
-- let s:base01 = '#14191f'
-- let s:base02 = '#0f1419'
-- let s:base023 = '#0f1419'
-- let s:base03 = '#e6b673'
-- let s:yellow = '#f5bf0f'
-- let s:orange = '#ff7733'
-- " let s:red = '#f53640'
-- let s:red = '#e31931'
-- let s:magenta = '#ffee99'
-- let s:blue = '#36a3d9'
-- let s:cyan = s:blue
-- let s:green = '#5ac92e'
-- let s:purple='#cb19e3'

-- VistaPlugin = extension.vista_nearest

local colors = {
    bg = '#282c34',
    line_bg = '#353644',
    fg = '#8FBCBB',
    fg_green = '#65a380',

    yellow = '#f5bf0f',
    cyan = '#36a3d9',
    darkblue = '#081633',
    green = '#afd700',
    orange = '#FF8800',
    purple = '#5d4d7a',
    magenta = '#c678dd',
    blue = '#51afef',
    red = '#ec5f67'
}
--}}}

-- Funciones {{{

local function checkwidth()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

-- local checkwidth = function()
--   return utils.has_width_gt(40) and buffer_not_empty()
-- end

local function lsp_status(status)
    shorter_stat = ''
    for match in string.gmatch(status, "[^%s]+")  do
        err_warn = string.find(match, "^[WE]%d+", 0)
        if not err_warn then
            shorter_stat = shorter_stat .. ' ' .. match
        end
    end
    return shorter_stat
end


local function get_coc_lsp()
  local status = vim.fn['coc#status']()
  if not status or status == '' then
      return ''
  end
  return lsp_status(status)
end

function get_diagnostic_info()
  if vim.fn.exists('*coc#rpc#start_server') == 1 then
    return get_coc_lsp()
    end
  return ''
end

local function get_current_func()
  local has_func, func_name = pcall(vim.fn.nvim_buf_get_var,0,'coc_current_function')
  if not has_func then return end
      return func_name
  end

function get_function_info()
  if vim.fn.exists('*coc#rpc#start_server') == 1 then
    return get_current_func()
    end
  return ''
end

local function trailing_whitespace()
    local trail = vim.fn.search("\\s$", "nw")
    if trail ~= 0 then
        return ' '
    else
        return nil
    end
end

CocStatus = get_diagnostic_info
CocFunc = get_current_func
TrailingWhiteSpace = trailing_whitespace

function has_file_type()
    local f_type = vim.bo.filetype
    if not f_type or f_type == '' then
        return false
    end
    return true
end

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

--}}}

-- Left LineConfig {{{

gls.left[1] = {
  FirstElement = {
    provider = function() return 'Pr0lGu ' end,
    separator=" ",
    highlight = {colors.line_bg,colors.blue,'bold'},
    separator_highlight = {colors.line_bg,colors.blue},
  },
}

gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local alias = {
          n = 'NORMAL',
          i = 'INSERT',
          c= 'COMMAND',
          V= 'VISUAL',
          [''] = 'VISUAL',
          v ='VISUAL',
          c  = 'CMD-LINE',
          ['r?'] = ':CONFIRM',
          rm = '--MORE',
          R  = 'REPLACE',
          Rv = 'VIRTUAL',
          s  = 'SELECT',
          S  = 'SELECT',
          ['r']  = 'HIT-ENTER',
          [''] = 'SELECT',
          t  = 'TERMINAL',
          ['!']  = 'SHELL'
      }
      local mode_color = {
          n = colors.magenta,
          i = colors.yellow,v=colors.magenta,[''] = colors.red,V=colors.red,
          c = colors.red,no = colors.magenta,s = colors.orange,S=colors.orange,
          [''] = colors.orange,ic = colors.yellow,R = colors.purple,Rv = colors.purple,
          cv = colors.red,ce=colors.red, r = colors.cyan,rm = colors.cyan, ['r?'] = colors.cyan,
          ['!']  = colors.green,t = colors.green,
          c  = colors.green,
          ['r?'] = colors.red,
          ['r']  = colors.red,
          rm = colors.red,
          R  = colors.yellow,
          Rv = colors.magenta,
      }
      local vim_mode = vim.fn.mode()
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim_mode])
      return ' '..alias[vim_mode] .. '  '
    end,
    highlight = {colors.red,colors.line_bg,'bold'},
  },
}
-- gls.left[3] ={
--   FileIcon = {
--     provider = 'FileIcon',
--     condition = buffer_not_empty,
--     highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.line_bg},
--   },
-- }

gls.left[4] = {
  FileName = {
    provider = 'FileName',
    condition = buffer_not_empty,
    separator= ' ',
    -- highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.line_bg,'bold'},
    highlight = {colors.white,colors.line_bg,'bold'},
    separator_highlight=  {colors.fg,colors.line_bg,'bold'},
 
  }
}

gls.left[5] = {
  GitIcon = {
    provider = function() return ' ' end,
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {colors.orange,colors.line_bg},
  }
}
gls.left[6] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {'#8FBCBB',colors.line_bg,'bold'},
  }
}


gls.left[7] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.green,colors.line_bg},
  }
}
gls.left[8] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.orange,colors.line_bg},
  }
}
gls.left[9] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.red,colors.line_bg},
  }
}
gls.left[10] = {
  LeftEnd = {
    provider = function() return '' end,
    separator = '',
    separator_highlight = {colors.bg,colors.line_bg},
    highlight = {colors.line_bg,colors.line_bg}
  }
}

gls.left[11] = {
    TrailingWhiteSpace = {
     provider = TrailingWhiteSpace,
     icon = '  ',
     highlight = {colors.yellow,colors.bg},
    }
}

-- gls.left[12] = {
--   DiagnosticError = {
--     provider = 'DiagnosticError',
--     icon = '  ',
--     highlight = {colors.red,colors.bg}
--   }
-- }
gls.left[12] = {
  DiagnosticError = {
    provider = function()
      local n = vim.lsp.diagnostic.get_count(0, 'Error')
      if n == 0 then return '' end
      return string.format(' %s %d ', u 'e009', n)
    end, 
    highlight = {colors.red,colors.bg}
  }
}
-- gls.left[13] = {
--   Space = {
--     provider = function () return ' ' end,
--     highlight = {colors.red,colors.bg}
--   }
-- }
gls.left[14] = {
   DiagnosticWarn = {
      provider = function()
        local n = vim.lsp.diagnostic.get_count(0, 'Warning')
        if n == 0 then return '' end
        return string.format(' %s %d ', u 'f071', n)
      end,

    highlight = {colors.yellow,colors.bg},
  }
}
-- gls.left[14] = {
--   DiagnosticWarn = {
--     provider = 'DiagnosticWarn',
--     icon = '  ',
--     highlight = {colors.yellow,colors.bg},
--   }
-- }
-- gls.left[12] = {
--   DiagnosticHint = {
--     provider = 'DiagnosticHint',
--     icon = '   ',
--     highlight = {colors.blue,colors.bg},
--   }
-- }
-- gls.left[13] = {
--   DiagnosticInfo = {
--     provider = 'DiagnosticInfo',
--     icon = '   ',
--     highlight = {colors.orange,colors.bg},
--   }
-- }

gls.left[15] = {
    CocStatus = {
     provider = CocStatus,
    icon = '  🗱',
     highlight = {colors.green,colors.bg},
    }
}

gls.left[16] = {
  CocFunc = {
    provider = CocFunc,
    icon = '  λ ',
    highlight = {colors.yellow,colors.bg},
  }
}
--}}}

-- Right LineConfig {{{

gls.right[1]= {
  Separatist = {
    provider = function() return ' ' end,
    separator = '',
    separator_highlight = {colors.bg,colors.line_bg},
    highlight = {colors.fg,colors.line_bg,'bold'},
  }
}
gls.right[2]= {
  FileSi = {
    provider = 'FileSize',
    separator = ' / ',
    separator_highlight = {colors.blue,colors.line_bg},
    highlight = {colors.fg,colors.line_bg,'bold'},
  }
}

gls.right[3]={
  FileIcon = {
    provider = 'FileFormat',
    separator= ' / ',
    condition = buffer_not_empty,
    separator_highlight = {colors.blue,colors.line_bg},
    highlight = {colors.white,colors.line_bg,},
  },
}

gls.right[4] = {
  LineInfo = {
    provider = 'LinePercent',
    -- separator = '  ',
    separator = ' / ',
    separator_highlight = {colors.blue,colors.line_bg},
    highlight = {colors.fg,colors.line_bg,'bold'},
  },
}
-- gls.right[4] = {
--   LineInfo = {
--     provider = {'LineColumn','LinePercent'},
--     -- separator = '  ',
--     separator = ' / ',
--     separator_highlight = {colors.blue,colors.line_bg},
--     highlight = {colors.fg,colors.line_bg,'bold'},
--   },
-- }

-- gls.right[5] = {
--   PerCent = {
--     provider = 'LinePercent',
--     separator = ' ',
--     separator_highlight = {colors.line_bg,colors.line_bg},
--     highlight = {colors.cyan,colors.line_bg,'bold'},
--   }
-- }

-- gls.right[4] = {
--   ScrollBar = {
--     provider = 'ScrollBar',
--     highlight = {colors.blue,colors.purple},
--   }
-- }
--
-- gls.right[3] = {
--   Vista = {
--     provider = VistaPlugin,
--     separator = ' ',
--     separator_highlight = {colors.bg,colors.line_bg},
--     highlight = {colors.fg,colors.line_bg,'bold'},
--   }
-- }

--}}}

-- Short LineConfig {{{
gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = '',
    condition = has_file_type,
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.fg,colors.purple}
  }
}


gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    separator = '',
    condition = has_file_type,
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.fg,colors.purple}
  }
}
 
--}}}

-- Force manual load so that nvim boots with a status line
gl.load_galaxyline()



