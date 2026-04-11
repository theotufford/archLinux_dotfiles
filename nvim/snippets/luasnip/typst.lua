-- via claude code
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Returns true if the cursor is inside a Treesitter `math` node
local function in_math()
  local ok, parsers = pcall(require, "nvim-treesitter.parsers")
  if not ok then return false end

  local parser = parsers.get_parser(0, "typst")
  if not parser then return false end

  local tree = parser:parse()[1]
  if not tree then return false end

  local root = tree:root()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local row, col = cursor[1] - 1, cursor[2]

  local node = root:named_descendant_for_range(row, col, row, col)

  -- Walk up the tree looking for a math ancestor
  while node do
    if node:type() == "math" then return true end
    node = node:parent()
  end
  return false
end

ls.add_snippets("typst", {

  -- \frac{}{} — only inside math
  s({ trig = "fr", condition = in_math, show_condition = in_math }, {
    t("frac("),
    i(1, "num"),
    t(", "),
    i(2, "denom"),
    t(")")
  }),

  -- sum with limits
  s({ trig = "sum", condition = in_math, show_condition = in_math }, {
    t("sum_("),
    i(1, "i=0"),
    t(")^("),
    i(2, "n"),
    t(") "),
    i(3)
  }),

  -- new set - (me not claude)
  s({ trig = "nst", condition = in_math, show_condition = in_math }, {
    i(1, "S"),
    t(" := lr({ "),
    i(2, "x "),
    t("mid(|) cases( delim: #none"),
    i(3, "case 1"),
    t(")space})")
  }),
  s({ trig = "cube", condition = in_math, show_condition = in_math }, {
    t("^ (3)")
  }),

})
