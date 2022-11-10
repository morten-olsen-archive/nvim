local keymap = vim.keymap
local isHard = true

local enforce = function()
  if isHard == false then
    vim.opt.mouse = "a"
    keymap.set("n", "<up>", "<up>")
    keymap.set("i", "<up>", "<up>")
    keymap.set("n", "<down>", "<down>")
    keymap.set("i", "<down>", "<down>")
    keymap.set("n", "<left>", "<left>")
    keymap.set("i", "<left>", "<left>")
    keymap.set("n", "<right>", "<right>")
    keymap.set("i", "<right>", "<right>")
  else
    vim.opt.mouse = ""
    keymap.set("n", "<up>", "<nop>")
    keymap.set("i", "<up>", "<nop>")
    keymap.set("n", "<down>", "<nop>")
    keymap.set("i", "<down>", "<nop>")
    keymap.set("n", "<left>", "<nop>")
    keymap.set("i", "<left>", "<nop>")
    keymap.set("n", "<right>", "<nop>")
    keymap.set("i", "<right>", "<nop>")
  end
end

keymap.set('n', '<leader>h',
  function()
    if isHard == true then
      isHard = false
      enforce()
      print("to easy!")
    else
      isHard = true
      enforce()
      print("going hard!")
    end
end, { noremap = true, silent = true, desc = "toggle hard mode!", }
)

enforce()
