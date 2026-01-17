local o, opt = vim.o, vim.opt
vim.g.mapleader = " "
o.omnifunc = ""
o.number = true
o.relativenumber = true
o.tabstop = 2
o.softtabstop = 2
o.breakindent = true
o.breakindentopt = "list:-1"
o.clipboard = "unnamedplus"
o.colorcolumn = "+0"
o.confirm = true
opt.cursorlineopt = { "number" }
opt.diffopt = {
  "filler",
  "indent-heuristic",
  "linematch:60",
  "vertical",
}
o.emoji = true
o.expandtab = true
o.fileignorecase = true
opt.fillchars = {
  eob = " ",
  diff = "╱",
  fold = " ",
  foldsep = " ",
  msgsep = "━",
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
}
opt.guicursor = {
  "n-sm:block",
  "v:hor50",
  "c-ci-cr-i-ve:ver10",
  "o-r:hor10",
  "a:Cursor/Cursor-blinkwait1-blinkon1-blinkoff1",
}
o.equalalways = true
o.hlsearch = true
o.inccommand = "split"
o.ignorecase = true
o.laststatus = 3
o.list = true
opt.listchars = {
  nbsp = "␣",
  tab = "  ",
  trail = "·",
}
o.signcolumn = "yes"
o.smartcase = true
o.softtabstop = -1
o.synmaxcol = 1000
o.termguicolors = true
o.timeout = false
o.title = true
o.titlestring = "nvim: %t"
o.undofile = true
o.updatetime = 250
opt.viewoptions = {
  "cursor",
  "folds",
}
o.virtualedit = "all"
o.wildignore = "*.o"
o.wildmode = "longest:full"
o.wildoptions = "pum"
o.winborder = "none"
o.writebackup = false
-- vim.o.winborder = "rounded"
local set = vim.keymap.set
set('n', "<leader>o", ":w<CR> :update<CR> :source<CR>")
set('n', "<leader>w", ":w<CR>")
set('n', "<leader>q", ":q<CR>")
local homeDir = os.getenv("HOME")
package.path = package.path .. ";" .. homeDir .. "/.config/nvim/packs/?.lua"
local packList = { -- order in which packages are added and then loaded
	"ui",
	"textEditing",
	"langSupport",
	"otherBinds",
	"gadgetSupport"
}

-- add packages
for _, pack in ipairs(packList) do
	require(pack).add()
end

-- setup / load package
for _, pack in ipairs(packList) do
	require(pack).setup()
end

