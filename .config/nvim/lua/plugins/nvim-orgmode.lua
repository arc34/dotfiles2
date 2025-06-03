-- Orgmode clone written in Lua for Neovim
return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    vim.cmd('language en_US.utf8')
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '~/.filestore/orgs/**',
      org_default_notes_file = '~/.filestore/orgs/refile.org',
    })
  end,
}
