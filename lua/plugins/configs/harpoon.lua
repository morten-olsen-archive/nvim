local keymap = vim.keymap
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

keymap.set("n", "<leader>a", function()
  mark.add_file()
end)

keymap.set("n", "<leader>h", function()
  ui.toggle_quick_menu()
end)

keymap.set("n", "<leader>1", function()
  ui.nav_file(1)
end)

keymap.set("n", "<leader>2", function()
  ui.nav_file(2)
end)

keymap.set("n", "<leader>3", function()
  ui.nav_file(3)
end)

keymap.set("n", "<leader>4", function()
  ui.nav_file(4)
end)
