-- Code Tree Support / Syntax Highlighting
return {
  -- https://github.com/nvim-treesitter/nvim-treesitter
  'nvim-treesitter/nvim-treesitter',
  event = 'VeryLazy',
  dependencies = {
    -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  opts = {
    highlight = {
      enable = true,
    },
    indent = { enable = true },
    auto_install = true, -- automatically install syntax support when entering new file type buffer
    ensure_installed = {
      'c',
      'cpp',
      'lua',
      'python',
      'bash',
      'yaml',
      'xml',
      'markdown',
      'markdown_inline',
      'javascript',
      'css',
      'html',
      'json',
      'yang',
    },
  },
  config = function (_, opts)
    local configs = require("nvim-treesitter.configs")
    configs.setup(opts)
  end
}

