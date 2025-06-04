local opt = vim.opt
local diagnostic = vim.diagnostic

-- Session Management
opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Equivalen to set nosc noru nosm
opt.sc=false
opt.ru=false
opt.sm=false
opt.lazyredraw=true

-- How many tenths of a second to blink when matching brackets
opt.mat=2

-- Line Numbers
opt.relativenumber = false
opt.number = true

-- Tabs & Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
--vim.bo.softtabstop = 2

-- Line Wrapping
opt.wrap = false

-- Search Settings
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

-- Cursor Line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.showmode = false
opt.conceallevel = 2
diagnostic.config {
  float = { border = "rounded" }, -- add border to diagnostic popups
  virtual_text = false
}

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
-- opt.clipboard:append("unnamedplus")
opt.clipboard = ""

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- Consider - as part of keyword
-- opt.iskeyword:append("-")

-- Disable the mouse while in nvim
opt.mouse = ""

-- Folding
opt.foldcolumn = '0'
opt.foldlevel = 20
opt.foldlevelstart = 99
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utilize Treesitter folds

-- Show Vertical Line highlight on column 80
opt.colorcolumn="80"

-- Jumps to last known position
vim.api.nvim_create_augroup("restore_cursor_position", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
    group = "restore_cursor_position",
    pattern = "*",
    callback = function()
        local mark_line = vim.fn.line("'\"")
        local last_line = vim.fn.line("$")
        if mark_line > 1 and mark_line <= last_line then
            vim.cmd('normal! g`"')
        end
    end
})

-- Enable Editor Config (already builtin from NVIM 0.9.0+)
-- vim.g.editorconfig = true
