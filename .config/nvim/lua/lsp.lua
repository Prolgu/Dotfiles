-- local lspconfig = require('lspconfig')
-- local util = require('lspconfig/util')
-- -- local lsp_status = require('lsp-status')
-- local api = vim.api

-- -- lsp_status.register_progress()

-- local custom_on_attach = function(client, bufnr)
--   api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

--   -- Mappings.

--   local opts = {
-- 		noremap=true,
-- 		silent=true,
-- 	}
-- 	local function nmap_lsp(keys, cmd)
-- 		api.nvim_buf_set_keymap(
-- 			bufnr, 'n', keys, '<cmd>lua vim.lsp.'..cmd..'<CR>', opts
-- 		)
-- 	end
-- 	nmap_lsp('gd',    'buf.declaration()')
--   nmap_lsp('<c-]>', 'buf.definition()')
-- 	nmap_lsp('K',     'buf.hover()')
--   nmap_lsp('D',     'util.show_line_diagnostics()')
--   nmap_lsp('gi',    'util.implementation()')
--   nmap_lsp('<C-k>', 'buf.signature_help()')
--   nmap_lsp(',rn',   'buf.rename()')
--   nmap_lsp('gy',    'buf.type_definition()')
--   nmap_lsp('pd',    'buf.peek_definition()')
--   nmap_lsp('gr',    'buf.references()')
--   nmap_lsp(']d',    'diagnostic.goto_next()')
--   nmap_lsp('[d',    'diagnostic.goto_prev()')
--   nmap_lsp('<leader>do',    'diagnostic.set_loclist()')
-- 	-- api.nvim_set_var('diagnostic_enable_virtual_text','1')
-- 	require'completion'.on_attach()
-- 	-- lsp_status.on_attach(client)
-- end

-- --  efm doesn't like being told to fold, so only fold on buffers that
-- --  don't have EFM but use an LSP server that supports folding.
-- local custom_on_attach_folding = function(client, bufnr)
-- 	custom_on_attach(client, bufnr)
-- 	require('folding').on_attach()
-- end

-- -- lspconfig.bashls.setup{
-- -- 	on_attach = custom_on_attach,
-- -- 	filetypes = { "sh", "zsh" }
-- -- }
-- -- lspconfig.ccls.setup{
-- -- 	on_attach = custom_on_attach_folding,
-- -- }
-- -- lspconfig.html.setup{
-- -- 	on_attach = custom_on_attach_folding,
-- -- }
-- -- lspconfig.cssls.setup{
-- -- 	cmd = {"/home/rkumar/Executables/npm/bin/vscode-json-languageserver"},
-- -- 	on_attach = custom_on_attach_folding,
-- -- 	root_dir = util.root_pattern("package.json",".git")
-- -- }
-- -- lspconfig.gopls.setup{
-- -- 	on_attach = custom_on_attach_folding,
-- -- 	init_options = {
-- -- 		linkTarget="pkg.go.dev",
-- -- 		completionDocumentation=true,
-- -- 		deepCompletion=true,
-- -- 		fuzzyMatching=true
-- -- 	}
-- -- }
-- -- lspconfig.dockerls.setup{
-- -- 	on_attach = custom_on_attach_folding,
-- -- }
-- -- lspconfig.ghcide.setup{
-- -- 	on_attach = custom_on_attach_folding,
-- -- }
-- -- lspconfig.jsonls.setup{
-- -- 	on_attach = custom_on_attach_folding,
-- -- }
-- -- lspconfig.vimls.setup{
-- -- 	on_attach = custom_on_attach
-- -- }
-- -- lspconfig.efm.setup{
-- -- 	on_attach = custom_on_attach,
-- -- 	-- only run on configured filetypes
-- -- 	filetypes = {'pandoc', 'markdown', 'gfm', 'markdown.pandoc.gfm', 'rst','sh','vim','make','yaml','dockerfile'},
-- -- }
-- -- lspconfig.jedi_language_server.setup{
-- -- 	on_attach = custom_on_attach,
-- -- }
-- lspconfig.pyright.setup{
-- 	on_attach=custom_on_attach,
-- }
-- local custom_on_attach_nlua = function(client, bufnr)
-- 	custom_on_attach_folding(client, bufnr)
-- end
-- require('nlua.lsp.nvim').setup(lspconfig, {
-- 	on_attach = custom_on_attach_nlua,
-- 	settings = {
-- 		Lua = {
-- 			runtime = {
-- 				version = "LuaJIT"
-- 			}
-- 		}
-- 	}
-- })




local nvim_lsp = require('lspconfig')
require'lspconfig'.tsserver.setup{}
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end


local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}
