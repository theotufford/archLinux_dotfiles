local pack = {}

function pack.add()
	-- no packages to add
end
function pack.setup()
  local vimap = vim.keymap.set;
	local defaults = {}
	local all = {"n", "v", "o"}

  vimap('n', '<Tab>', '<Nop>', { noremap = true, silent = true })

	vimap(all, "<C-W><Left>", "<C-W>h", defaults)
	vimap(all, "<C-W><Down>", "<C-W>j", defaults)
	vimap(all, "<C-W><Up>", "<C-W>k", defaults)
	vimap(all, "<C-W><Right>", "<C-W>l", defaults)
	vimap(all, "\\", "<cmd>let @/ = \"\" <CR>", defaults)

	vimap("n", "<leader>t", "*N:s///g<Left><Left>", defaults)
	vimap("n", "<leader>T", "*N:%s///g<Left><Left>", defaults)
	vimap("v", "t", 'y:s/"//g<Left><Left>', defaults)
	vimap("v", "T", 'y:%s/"//g<Left><Left>', defaults)
  vimap("n", "s", "g;", defaults)


end
return pack
