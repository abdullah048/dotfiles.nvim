local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'thick',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    separator = {
      fg = '#fdf6e3',
      -- fg = '#073642',
      -- bg = '#002b36',
    },
    separator_selected = {
      -- fg = '#073642',
    },
    background = {
      fg = '#657b83',
      -- bg = '#002b36'
    },

    fill = {
      -- bg = '#073642'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true,
    },
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
