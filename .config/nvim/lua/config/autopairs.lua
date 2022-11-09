local npairs = require('nvim-autopairs')
local Rule   = require('nvim-autopairs.rule')
local ts_conds = require('nvim-autopairs.ts-conds')

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
    }
})



-- press % => %% is only inside comment or string
npairs.add_rules{
  -- Rule("%", "%", "lua")
  --   :with_pair(ts_conds.is_ts_node({'string','comment'})),
  -- Rule("$", "$", "lua")
  --   :with_pair(ts_conds.is_not_ts_node({'function'}))


-- before   insert  after
--  (|)     ( |)	( | )
  Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
  Rule('( ', ' )')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%)') ~= nil
      end)
      :use_key(')'),
	Rule('{ ', ' }')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%}') ~= nil
      end)
      :use_key('}'),
  Rule('[ ', ' ]')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%]') ~= nil
      end)
      :use_key(']'),
  --[===[
  arrow key on javascript
      Before 	Insert    After
      (item)= 	> 	    (item)=> { }
  --]===]
  Rule('%(.*%)%s*%=>$', ' {  }', { 'typescript', 'typescriptreact', 'javascript' })
    :use_regex(true)
    :set_end_pair_length(2),
}

