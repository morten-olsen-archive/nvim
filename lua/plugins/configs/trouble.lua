local map = nvchad.map

require("trouble").setup {
  auto_open = true,
  auto_close = true,
  use_diagnostic_signs = true,
}

map("n", "gl", "<cmd> :TroubleToggle<CR>")
