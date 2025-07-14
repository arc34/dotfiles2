return {
  -- https://github.com/MeanderingProgrammer/render-markdown.nvim
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  ft = { "markdown", "codecompanion" },
  -- ft = { "codecompanion" },
  opts = {
    -- configurations go here
    -- enabled = false,
    heading = {
      enabled = false,
    },
    code = {
      enabled = false,
    }
  },
}

