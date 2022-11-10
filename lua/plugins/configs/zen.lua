local true_zen = require("true-zen")
local map = nvchad.map

true_zen.setup({
  ui = {
    bottom = {
      laststatus = 0,
      ruler = false,
      showmode = false,
      showcmd = false,
      cmdheight = 1,
    },
    top = {
      showtabline = 0,
    },
    left = {
      number = true,
      relativenumber = true,
      signcolumn = "yes",
    },
  },
  integrations = {
    --vim_gitgutter = true,
    --gitsigns = true,
    -- nvim_bufferline = true,
    twilight = true,
    tmux = true
  },
})

map('n', '<leader>z', '<cmd>:TZAtaraxis<CR>')
