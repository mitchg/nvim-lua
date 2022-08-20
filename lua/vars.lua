--[[ vars.lua ]]

local g = vim.g
g.t_co = 256
-- vim.cmd('colorscheme onedark')
-- Update the packpath
local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path
vim.g.python3_host_prog = '~/usr/bin/python3'

