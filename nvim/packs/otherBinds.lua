local pack = {}

function pack.add()
	-- no packages to add
end
function pack.setup()
	local opts = {noremap=true, silent=true}
	local all = {"n", "v", "o"}
	vim.keymap.set(all, "<C-W><Left>", "<C-W>h", opts)
	vim.keymap.set(all, "<C-W><Down>", "<C-W>j", opts)
	vim.keymap.set(all, "<C-W><Up>", "<C-W>k", opts)
	vim.keymap.set(all, "<C-W><Right>", "<C-W>l", opts)
end
return pack
