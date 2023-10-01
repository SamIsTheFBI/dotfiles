local status, nvimtree = pcall(require, 'nvim-tree')
if (not status) then return end

nvimtree.setup({
  auto_reload_on_write = true,
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  diagnostics = {
    enable = false,
    icons = { hint = "", info = "", warning = "", error = "" },
  },
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  system_open = { cmd = nil, args = {} },
  git = {
    ignore = false,
  },
  filters = {
    dotfiles = true,
    custom = {
      "^\\.git$",
      "node_modules",
      "^\\.cache$",
    },
  },
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  renderer = {
    add_trailing = false,
    highlight_git = true,
    highlight_opened_files = "all",
    root_folder_modifier = ":t",
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "",
          deleted = "",
          ignored = "",
        },
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
      },
    },
  },
  view = {
    adaptive_size = false,
    width = 25,
    side = "left",
    preserve_window_proportions = true,
  },
})
