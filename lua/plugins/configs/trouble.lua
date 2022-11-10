local map = nvchad.map

require("trouble").setup {
  use_diagnostic_signs = true,
}

map("n", "<leader>t", "<cmd> :TroubleToggle<CR>")
