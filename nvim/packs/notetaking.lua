local mod = {}
function mod.add()
  vim.pack.add({
    { src = "https://github.com/YousefHadder/markdown-plus.nvim" },
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
    { src = "https://github.com/chomosuke/typst-preview.nvim" },
    { src = "https://github.com/epwalsh/obsidian.nvim" },
    { src = "https://github.com/XXiaoA/atone.nvim" },
    { src = "https://github.com/kaarmu/typst.vim" },
    { src = "https://github.com/3rd/image.nvim" }
  })
end

function mod.setup()
  -- atone (modern undotree) ------------------------
  local atone = require("atone")
  atone.setup()

  vim.keymap.set("n", "<leader>u", "<cmd>Atone<cr>")

  -- markdown editing -------------------------------
  local md = require("markdown-plus")
  local render_md = require("render-markdown")

  md.setup()
  render_md.setup()

  -- image rendering --------------------------------
  -- not working
  -- local image = require("image")
  -- image.setup({
  --   resolve_image_path = function(document_path, image_path, fallback)
  --     local working_dir = vim.fn.getcwd()
  --     -- Format image path for Obsidian notes
  --     if (working_dir:find("/home/theo/notes/")) then
  --       return working_dir .. "/" .. image_path
  --     end
  --     -- Fallback to the default behavior
  --     return fallback(document_path, image_path)
  --   end,
  -- })
  -- image.enable()


  -- typst editing  ---------------------------------
  local render_typ = require("typst-preview")
  render_typ.setup()

  -- obsidian editing -------------------------------
  local obsd = require("obsidian")
  obsd.setup({
    workspaces = {
      {
        name = "notes",
        path = "~/notes/",
      },
    },
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },
    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
      name = "telescope.nvim",
      -- Optional, configure key mappings for the picker. These are the defaults.
      -- Not all pickers support all mappings.
      note_mappings = {
        -- Create a new note from your query.
        new = "<C-x>",
        -- Insert a link to the selected note.
        insert_link = "<C-l>",
      },
      tag_mappings = {
        -- Add tag(s) to current note.
        tag_note = "<C-x>",
        -- Insert a tag at the current location.
        insert_tag = "<C-l>",
      },
    },
  })
  vim.keymap.set("n", "<leader>a", "<cmd>ObsidianQuickSwitch<CR>")
end

return mod
