return {
  -- https://github.com/olimorris/codecompanion.nvim
  "olimorris/codecompanion.nvim",
  opts = {
    -- configurations go here
    -- enabled = false,
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            schema = {
              model = {
                default = "gemini-2.5-pro-preview-05-06",
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "gemini",
        },
        inline = {
          adapter = "gemini",
        },
      },
    })
  end
}
