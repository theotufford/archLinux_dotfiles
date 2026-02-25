local mod = {}
function mod.add()
  vim.pack.add({
    { src = "https://github.com/EdenEast/nightfox.nvim" },
    { src = "https://github.com/nvim-mini/mini.icons" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/ribru17/bamboo.nvim" },
    -- { src = "https://github.com/mcauley-penney/techbase.nvim" }
  })
end

function mod.setup()
  -- require("statusline")
  vim.cmd("colorscheme bamboo")
  require "mini.pick".setup()
  require "mini.icons".setup()
  require "oil".setup()


  vim.keymap.set('n', "<leader><leader>", ":Pick files<CR>")
  vim.keymap.set('n', "<leader>e", ":Oil<CR>")

  vim.keymap.set('n', "<leader>h", ":Pick help<CR>")
  vim.keymap.set('n', "<leader>H", vim.lsp.buf.hover)

  local telescope = require('telescope.builtin')
  vim.keymap.set(
    'n',
    '<leader>g',
    telescope.live_grep,
    { desc = 'Telescope live grep' }
  )

  vim.opt.conceallevel = 1

end

return mod
