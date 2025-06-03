-- to copy images from your system clipboard into a chat buffer via :PasteImage:
return {
  -- https://github.com/hakonharnes/img-clip.nvim
  "HakonHarnes/img-clip.nvim",
  opts = {
    filetypes = {
      codecompanion = {
        prompt_for_file_name = false,
        template = "[Image]($FILE_PATH)",
        use_absolute_path = true,
      },
    },
  },
}
