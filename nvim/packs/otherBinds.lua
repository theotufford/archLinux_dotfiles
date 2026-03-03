local pack = {}

function pack.add()
	-- no packages to add
end
function pack.setup()
	local opts = {}
	local all = {"n", "v", "o"}
	vim.keymap.set(all, "<C-W><Left>", "<C-W>h", opts)
	vim.keymap.set(all, "<C-W><Down>", "<C-W>j", opts)
	vim.keymap.set(all, "<C-W><Up>", "<C-W>k", opts)
	vim.keymap.set(all, "<C-W><Right>", "<C-W>l", opts)
	vim.keymap.set(all, "\\", "<cmd>let @/ = \"\" <CR>", opts)

	vim.keymap.set("n", "t", "*N:s///g<Left><Left>", opts)
	vim.keymap.set("n", "T", "*N:%s///g<Left><Left>", opts)
	vim.keymap.set("v", "t", 'y:s/"//g<Left><Left>', opts)
	vim.keymap.set("v", "T", 'y:%s/"//g<Left><Left>', opts)

  vim.keymap.set("n", "<leader>s", "vwS", opts)


end
return pack
