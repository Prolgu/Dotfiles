local function on_attach()
  -- keymaps for lsp
  vim.api.nvim_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<cr>', { noremap = true })
  -- vim.api.nvim_set_keymap('n', '<leader>gd', ':lua vim.lsp.buf.definition()<cr>', {noremap = true})


  vim.api.nvim_set_keymap('n', '<leader>vo', ':LspRestart<cr>', { noremap = true })

  -- diagnostics to move between info and errors
  vim.api.nvim_set_keymap('n', 'gn', ':lua vim.diagnostic.goto_next()<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', 'gp', ':lua vim.diagnostic.goto_prev()<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>gd', ':lua vim.diagnostic.open_float()<cr>', { noremap = true })


  -- vim.api.nvim_set_keymap('n', '<leader>vca', ':lua vim.lsp.buf.code_action()<cr>', {noremap = true})
  -- vim.api.nvim_set_keymap('n', '<leader>fo', ':lua vim.lsp.buf.formatting()<cr>', {noremap = true})

  vim.api.nvim_set_keymap('n', '<leader>gi', ':lua vim.lsp.buf.implementation()<cr>', { noremap = true })
  -- vim.api.nvim_set_keymap('n', '<leader>vrn', ':lua vim.lsp.buf.rename()<cr>', {noremap = true})

  require "lsp_signature".on_attach()

  vim.cmd [[au Filetype php setl omnifunc=v:lua.vim.lsp.omnifunc]]
  vim.cmd [[autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc]]

  vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }

end

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
  local opts = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
    },
  }

  -- (optional) Customize the options passed to the server
  if server.name == "emmet_ls" then
    opts.filetypes = { "html", "css", "blade" }
  end

  opts.on_attach = on_attach
  -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

local nvim_lsp = require 'lspconfig'
local on_attach = function(client)
  require 'completion'.on_attach(client)

end
local servers = { "pyright", "rust_analyzer", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end


-- local nvim_lsp = require('lspconfig')
require 'lspconfig'.tsserver.setup {
  on_attach = on_attach,

  tools = {
    autoSetHints = false,
    hover_with_actions = true,
    runnables = {
      use_telescope = true
    },
    inlay_hints = {
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  root_dir = function() return vim.loop.cwd() end -- run lsp for javascript in any directory


}


-- nvim_lsp.sumneko_lua.setup({


-- })


nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach,

  tools = {
    autoSetHints = false,
    hover_with_actions = true,
    runnables = {
      use_telescope = true
    },
    inlay_hints = {
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "by_self",
      },
      cargo = {
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      },
    }
  }
})
