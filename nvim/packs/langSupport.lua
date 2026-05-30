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
      "jsonls",
			"pylsp",
			"svelte",
      "ts_ls",
			"clangd",
			"eslint",
			"lua_ls",
      "tinymist"
		}
	})
	-- LSP settings ---------------------------------------------------------
	local lspconfig = vim.lsp.config
  local lspEnable = vim.lsp.enable
	-- Common on_attach
	local onAttach = function(_, bufnr)
		local opts = { noremap = false, buffer = bufnr, silent = true }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	end
	lspconfig['jsonls'] = {
		on_attach = onAttach
	}
	lspEnable('jsonls')

	lspconfig['tinymist'] = {
		on_attach = onAttach
	}
	lspEnable('tinymist')


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
	lspEnable('lua_ls')

	lspconfig['pylsp']= {

		on_attach = onAttach
	}
	lspEnable('pylsp')

	lspconfig['eslint']= {
		on_attach = onAttach
	}
	lspEnable('eslint')

	lspconfig['ts_ls']= {
		on_attach = onAttach
	}
	lspEnable('ts_ls')

	lspconfig['svelte']= {
		on_attach = onAttach
	}
	lspEnable('svelte')

	lspconfig['bashls'] = {
		on_attach = onAttach
	}
	lspEnable('bashls')

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

  lspEnable('clangd')

	-- treesitter settings ---------------------------------------------------------
	require("nvim-treesitter.configs").setup({
		auto_install = true,
		ensure_installed = {
			"lua",
			"markdown",
			"python",
			"r",
			"javascript",
			"typescript",
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
