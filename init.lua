vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.cmd('if argc() == 1 && isdirectory(argv(0)) | cd `=argv(0)` | endif')
vim.cmd('set mouse=')

local function open_nvim_tree()
  -- Prevents multiple opening
  require("nvim-tree.api").tree.open()
end

-- Open NvimTree on VimEnter event
vim.api.nvim_create_autocmd("VimEnter", {
  callback = open_nvim_tree,
})

vim.cmd('set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab')

require "nvim-tree".setup {
  diagnostics = {
    enable = true,
  }
}

vim.cmd('set ww=')
require('nvim-autopairs').disable()
