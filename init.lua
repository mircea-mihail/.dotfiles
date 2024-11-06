vim.g.mapleader = ","

vim.api.nvim_set_keymap('i', 'kj', '<Esc>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('v', '<Up>', '5k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<Down>', '5j', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Up>', '5k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Down>', '5j', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<C-y>', '"+y', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-y>', '"+y', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<C-p>', '"+p', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-p>', '"+p', {noremap = true, silent = true})

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- install plugin manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local uv = vim.uv or vim.loop

-- Auto-install lazy.nvim if not present
if not uv.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
  print('Done.')
end

vim.opt.rtp:prepend(lazypath) 

require('lazy').setup(
{
	  -- add lsp packages for language support
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},

	{'preservim/nerdtree'},	-- left panel with files
	{'rebelot/kanagawa.nvim'},	-- aesthetic

	{'jpalardy/vim-slime'},
	{'vim-scripts/vim-ipython-cell'},  -- For running Python cells
	{'benlubas/molten-nvim'},  -- For interactive plotting
})

vim.g.python3_host_prog = '/usr/bin/python3'

-- configure ipythoncell 
-- Key mappings for vim-ipython-cell
vim.g.ipython_cell_tag = '# %%'
vim.g.ipython_cell_mappings = 1

-- Slime configuration
vim.g.slime_target = "tmux"
vim.g.slime_default_config = {socket_name = "default", target_pane = "{right-of}"}
vim.g.slime_dont_ask_default = 1
vim.g.ipythoncell_term = "term"
vim.g.ipythoncell_ipython = "ipython"

vim.api.nvim_set_keymap('n', '<Leader>rc', ':IPythonCellExecuteCell<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ra', ':IPythonCellExecuteAll<CR>', { noremap = true, silent = true })

-- language server
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available  
	lsp_zero.default_keymaps({buffer = bufnr})
end)

require('lspconfig').pyright.setup({})
-- require('lspconfig').bashls.setup({})
require('lspconfig').clangd.setup({})

-- colorscheme cronology:
-- vim.cmd.colorscheme('default')
-- vim.cmd.colorscheme('lunaperche')
vim.cmd.colorscheme('kanagawa')

	-- HUD related:
-- open tree on file open
vim.api.nvim_set_keymap('n', '<C-b>', ':NERDTreeToggle<CR>', {noremap = true, silent = true})
-- open nerdtree when opening any file
-- vim.api.nvim_create_autocmd("VimEnter", { pattern = "*", callback = function() vim.cmd("NERDTree") end })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', 'gh', 'gT', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gl', 'gt', {noremap = true, silent = true})

