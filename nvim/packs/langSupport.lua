local pack = {}
function pack.add()
	local packList = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
		"mason-org/mason-lspconfig.nvim",
		"nvim-lua/plenary.nvim",
		"R-nvim/R.nvim",
	}
	for _, packName in ipairs(packList) do
		vim.pack.add({ { src = "https://github.com/" .. packName } })
	end
	vim.pack.add({ {
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = 'master',
		build = ":TSUpdate"
	} })
end

function pack.setup()

	require "nvim-treesitter".setup()
	require "mason".setup()
	require "r".setup()

	require("mason-lspconfig").setup({
		ensure_installed = {
			"bashls",
			"pylsp",
			"svelte",
			"clangd",
			"biome",
			"lua_ls",
      "tinymist"
		}
	})
	-- LSP settings ---------------------------------------------------------
	local lspconfig = vim.lsp.config
	-- Common on_attach
	local onAttach = function(_, bufnr)
		local opts = { noremap = false, buffer = bufnr, silent = true }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	end

	lspconfig['tinymist'] = {
		on_attach = onAttach
	}
	vim.lsp.enable('tinymist')


	-- Lua (for Neovim)
	lspconfig['lua_ls'] = {
		on_attach = onAttach,
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				workspace = { checkThirdParty = false },
			},
		}
	}
	vim.lsp.enable('lua_ls')

	lspconfig['pylsp']= {
		on_attach = onAttach
	}
	vim.lsp.enable('pylsp')

	lspconfig['biome']= {
		on_attach = onAttach
	}
	vim.lsp.enable('biome')

	lspconfig['svelte']= {
		on_attach = onAttach
	}
	vim.lsp.enable('svelte')

	lspconfig['bashls'] = {
		on_attach = onAttach
	}
	vim.lsp.enable('bashls')

	-- C / C++ (Pi-Pico)
	local picoPath = os.getenv("PICO_SDK_PATH")
  if (picoPath ~= nil) then
	lspconfig['clangd'] = {
		on_attach = onAttach,
		cmd = { "clangd",
			--"--background-index",
			"--compile-commands-dir=build",
			--			"--query-driver=/usr/bin/g++",
			"--query-driver=" .. picoPath

		},
	}
  else
	lspconfig['clangd'] = {
		on_attach = onAttach
	}
  end

  vim.lsp.enable('clangd')

	-- treesitter settings ---------------------------------------------------------
	require("nvim-treesitter.configs").setup({
		auto_install = true,
		ensure_installed = {
			"lua",
			"markdown",
			"python",
			"r",
			"javascript",
			"tsx",
			"html",
			"css",
			"c",
			"cpp",
			"bash",
			"json",
			"svelte",
      "typst",
      "java",
      "jsdoc",
      "javadoc",

		},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<CR>", -- start selection
				node_incremental = "<CR>", -- grow
				node_decremental = "<BS>", -- shrink
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
		},
	})
	vim.keymap.set('n', "<leader>lf", vim.lsp.buf.format)

	-- Manim binds ---------------------------------------------------------
  vim.keymap.set("n", "<leader>tm", "<cmd>!manim -pqm --disable_caching --renderer=opengl main.py quick<cr>")

end

return pack
