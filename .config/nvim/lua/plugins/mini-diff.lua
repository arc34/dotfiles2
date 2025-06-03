-- for a cleaner diff when using the inline assistant or the @editor tool
return {
  -- https://github.com/echasnovski/mini.diff
  'echasnovski/mini.diff',
  config = function()
    local diff = require("mini.diff")
    diff.setup({
      -- Disabled by default
      source = diff.gen_source.none(),
    })
  end,
}
