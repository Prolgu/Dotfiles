require('luasnip.loaders.from_vscode').lazy_load()
local lspkind = require "lspkind"
local luasnip = require("luasnip")
local cmp = require "cmp"
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

cmp.setup {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
    -- expand = function(args)
    --   vim.fn["UltiSnips#Anon"](args.body)
    -- end,
  },
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.close()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.choice_active() then
        luasnip.change_choice(1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<Cr>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    -- ["<Tab>"] = cmp.mapping(function(fallback)
    --       if cmp.visible() then cmp.select_next_item()
    --       elseif luasnip.expandable() then  luasnip.expand()
    --       elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
    --       elseif check_backspace() then fallback()
    --       else fallback()
    --       end
    --     end, { "i", "s"}),
    --    ["<S-Tab>"] = cmp.mapping(function(fallback)
    --      if cmp.visible() then cmp.select_prev_item()
    --      elseif luasnip.jumpable(-1) then luasnip.jump(-1)
    --      else fallback()
    --      end
    --    end, { "i", "s"}),
    -- ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<c-space>"] = cmp.mapping.complete(),

    ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
    ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
  },
  sources = {
    { name = 'nvim_lsp', priority = 100 },
    { name = "luasnip", priority = 10 },
    { name = "treesitter", max_item_count = 10 },
    -- { name = "nvim_lsp" },
    { name = "path" },
    { name = "nvim_lua" },
    -- { name = 'ultisnips', keyword_length = 2, priority = 50 },  -- workaround '.' trigger
    -- { name = 'path', priority = 30, },
    -- { name = 'buffer', priority = 10 },
    {
      name = "buffer",
      keyword_length = 5,
      option = {
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end
      }
    },
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer        = "[Buffer]",
        nvim_lsp      = "[LSP]",
        luasnip       = "[LuaSnip]",
        treesitter    = "[treesitter]",
        -- ultisnips     = "[UltiSnips]",
        nvim_lua      = "[Lua]",
        latex_symbols = "[Latex]",
        -- luasnip = "[snip]",
        -- ultisnips     = "[UltiSnips]",
        -- buffer = "[buf]",
        path          = "[path]",
        -- nvim_lua = "[api]",
      }
    }
  },
  experimental = {
    native_menu = false,
    ghost_text = false,
  }
}


-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['emmet_ls'].setup {
  capabilities = capabilities
}

require('lspconfig')['tsserver'].setup {
  capabilities = capabilities
}
local Group = require("colorbuddy.group").Group
local g = require("colorbuddy.group").groups
local s = require("colorbuddy.style").styles

Group.new("CmpItemAbbr", g.Comment)
Group.new("CmpItemAbbrDeprecated", g.Error)
Group.new("CmpItemAbbrMatchFuzzy", g.CmpItemAbbr.fg:dark(), nil, s.italic)
Group.new("CmpItemKind", g.Special)
Group.new("CmpItemMenu", g.NonText)
