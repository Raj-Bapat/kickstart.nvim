return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    -- Plugin configuration
    require('toggleterm').setup {
      size = 20, -- Set the size of the terminal window (optional)
      open_mapping = [[<c-t>]], -- Shortcut to toggle terminal (optional)
      shade_filetypes = {},
      shade_terminals = true, -- Whether to shade terminal windows (optional)
      shading_factor = 2, -- The shading level (optional)
      start_in_insert = true, -- Start in insert mode in the terminal (optional)
      persist_size = true, -- Persist terminal size between sessions (optional)
      direction = 'float', -- Horizontal or vertical terminal (optional)
    }

    -- Set terminal keymaps function
    local function set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    end

    -- Apply keymaps when opening terminal
    vim.api.nvim_create_autocmd('TermOpen', {
      pattern = 'term://*toggleterm#*',
      callback = function()
        set_terminal_keymaps()
      end,
    })
  end,
}
