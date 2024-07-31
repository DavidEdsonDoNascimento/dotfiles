local g = vim.g
local opt = vim.opt

g.mapleader = " "
g.python3_host_prog = "/home/david/Python-3.12.4/python"
g.python_host_prog = "/home/david/Python-3.12.4/python"

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.number = true

opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 0
opt.laststatus = 0
opt.expandtab = true
opt.scrolloff = 10
opt.inccommand = "split"
opt.ignorecase = true
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.wrap = false
opt.backspace = { "start", "eol", "indent" }
opt.path:append({ "**" })
opt.wildignore:append({ "*/node_modules/*" })
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "cursor"
opt.mouse = ""

-- Add asterisks in block comments
opt.formatoptions:append({ "r" })

vim.cmd([[command! FixWhitespace :%s/\s\+$//e ]])

vim.cmd([[
cnoreabbrev W w
cnoreabbrev W! w!
cnoreabbrev Q q
cnoreabbrev Q! q!
cnoreabbrev Qa qa
cnoreabbrev Qa! qa!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev WQ wq
cnoreabbrev Wqa wqa
  ]])
