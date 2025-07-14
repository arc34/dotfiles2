return {
  -- https://github.com/preservim/vim-markdown
  "preservim/vim-markdown",
  opts = {
    -- configurations go here
    enabled = false,
  },
  config = function(_, opts)
    vim.g.vim_markdown_folding_style_pythonic = 1
    vim.g.vim_markdown_conceal_code_blocks = 0
  end
}

