local pack = {}

function pack.add()
	-- no packages to add
end
function pack.setup()
  local vimap = vim.keymap.set;
	local opts = {}
	local all = {"n", "v", "o"}

	vimap(all, "<C-W><Left>", "<C-W>h", opts)
	vimap(all, "<C-W><Down>", "<C-W>j", opts)
	vimap(all, "<C-W><Up>", "<C-W>k", opts)
	vimap(all, "<C-W><Right>", "<C-W>l", opts)
	vimap(all, "\\", "<cmd>let @/ = \"\" <CR>", opts)

	vimap("n", "<leader>t", "*N:s///g<Left><Left>", opts)
	vimap("n", "<leader>T", "*N:%s///g<Left><Left>", opts)
	vimap("v", "t", 'y:s/"//g<Left><Left>', opts)
	vimap("v", "T", 'y:%s/"//g<Left><Left>', opts)

  vimap("n", "s", "g;", opts)


end
return pack
