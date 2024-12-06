vim.cmd([[packadd nvim-autopairs]])
local npairs = require('nvim-autopairs')

npairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
  check_ts = true,
})

local Rule = require('nvim-autopairs.rule')

-- should prevent auto-closing `{` inside `""`
npairs.add_rules({
  Rule("{", "")
    :with_pair(function(opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return pair ~= '""'
    end)
})
