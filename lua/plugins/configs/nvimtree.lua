local present, nvimtree = pcall(require, "nvim-tree")

if not present then
   return
end

-- globals must be set prior to requiring nvim-tree to function
local options = {
   filters = {
      dotfiles = false,
      exclude = { "custom" },
   },
   disable_netrw = true,
   hijack_netrw = true,
   ignore_ft_on_setup = { "dashboard" },
   open_on_tab = true,
   open_on_setup = true,
   hijack_cursor = true,
   hijack_unnamed_buffer_when_opening = false,
   update_cwd = true,
   update_focused_file = {
      enable = true,
      update_cwd = false,
   },
   view = {
      side = "left",
      width = 25,
      hide_root_folder = true,
      relativenumber = true,
   },
   git = {
      enable = false,
      ignore = true,
   },
   actions = {
      open_file = {
         resize_window = true,
      },
   },
   renderer = {
      add_trailing = false,
      highlight_opened_files = "none",
      indent_markers = {
         enable = false,
      },
      icons = {
        show = {
           folder = true,
           file = true,
           git = true,
           folder_arrow = true,
        },
        glyphs = {
           default = "",
           symlink = "",
           git = {
              deleted = "",
              ignored = "◌",
              renamed = "➜",
              staged = "✓",
              unmerged = "",
              unstaged = "✗",
              untracked = "★",
           },
           folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
              arrow_open = "",
              arrow_closed = "",
           },
        },
      },
   },
}

-- check for any override
options = nvchad.load_override(options, "kyazdani42/nvim-tree.lua")

nvimtree.setup(options)
