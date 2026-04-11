local mod = {}
function mod.add()
  vim.pack.add({
    { src = "https://github.com/kylechui/nvim-surround" },
    { src = "https://github.com/Saghen/blink.cmp", },
    { src = "https://github.com/L3MON4D3/LuaSnip",                         version = "v2.4.0" },
    { src = "https://github.com/nosduco/remote-sshfs.nvim" },
  })
end

function mod.setup()
  local vmp = vim.keymap.set

  -- snippets config -------------------------------
  local ls = require("luasnip")
  ls.setup({ enable_autosnippets = true })
  local homedir = os.getenv('HOME')

  require("luasnip.loaders.from_vscode").load({ paths = { homedir .. "/.config/nvim/snippets/vscode" } })
  require("luasnip.loaders.from_lua").load({ paths = { homedir .. "/.config/nvim/snippets/luasnip" } })
  vmp({ "i", "s" }, "<S-tab>", function() ls.jump(-1) end, { silent = true })

  -- autocomplete interface -------------------------------
  require("blink.cmp").setup({
    snippets = { preset = 'luasnip' },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = "lua" },
    keymap = {
      ['<S-Tab>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<CR>'] = { 'select_and_accept', 'fallback' },
      --			['<CR>'] = { 'accept', function() return '\n' end },
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
    }
  })
  -- remote editing -------------------------------
  require('telescope').load_extension 'remote-sshfs'
  local sshfs = require('remote-sshfs')
  sshfs.setup()
  local api = require('remote-sshfs.api')
  vmp('n', '<leader>rc', api.connect, {})
  vmp('n', '<leader>rd', api.disconnect, {})
  vmp('n', '<leader>re', api.edit, {})

  -- pair editing -------------------------------
  local surround = require "nvim-surround" -- gotta make these binds better most dont work
  surround.setup()
end

return mod
