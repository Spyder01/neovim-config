-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<leader>ex', ':NvimTreeToggle<CR>')

-- Ensure that transparency is set for floating windows
vim.cmd('hi NormalFloat guibg=NONE')

require("nvim-tree").setup({
	disable_netrw = false,
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,  -- Set the width of the panel
    side = 'left',  -- Position the panel on the left
    float = {
      enable = false,  -- Disable floating to keep the panel fixed on the side
    },
  },
  filters = {
    -- dotfiles = true,
  },
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  }
})

