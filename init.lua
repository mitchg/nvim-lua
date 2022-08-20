
-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plug')      -- Plugins
require('which-key')   --whichkey mappings

-- PLUGINS: ADD this section
require('nvim-tree').setup{}

require('onedark').setup {
   style = 'deep'
}
require('onedark').load()
--require('tokyonight').load{}

require('lualine').setup {
  options = {
    theme = 'onedark'}
}

require('which-key').setup{}
require('nvim-autopairs').setup{}



