local pack = {}
function pack.add()
	vim.pack.add({
    {"https://github.com/tpope/vim-fugitive"},
    {"https://github.com/lewis6991/gitsigns.nvim"},
  })
end
function pack.setup()
end
return pack
