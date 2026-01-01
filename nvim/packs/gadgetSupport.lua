local pack = {}
function pack.add()
	vim.pack.add({
		{src = "https://github.com/akinsho/toggleterm.nvim"},
		{src = "https://github.com/akinsho/dressing.nvim"},
		{src = "https://github.com/jim-at-jibba/micropython.nvim"}
	})
end
function pack.setup()
	local dressing = require("dressing")
	dressing.setup()
	local toggleterm = require("toggleterm")
	toggleterm.setup()
	local mpy = require("micropython_nvim")
	vim.keymap.set("n", "<leader>mr", mpy.run )


end
return pack
