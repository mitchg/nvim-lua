vim.g.mapleader = "<SPACE>"
vim.g.localleader = "\\"
vim.g.completion_enable_snippet = 'snippets.nvim'

-- IMPORTS
require('user.vars')      -- Variables
require('user.opts')      -- Options
require('user.keys')      -- Keymaps
require('user.plug')      -- Plugins
--require('which-key')   --whichkey mappings

-- PLUGINS: ADD this section
require("startup").setup({theme = "startify"})
require('nvim-tree').setup{}

require('onedark').setup {
   style = 'deep' 
}
require('onedark').load()
 
--require('tokyonight').load{}
 
--Status Line
require('lualine').setup {
  options = {
    theme = 'onedark'}
}
require( 'luasnip.loaders.from_vscode' ).lazy_load()
require( 'which-key' ).setup{}
require( 'nvim-autopairs' ).setup{}
require( 'telescope')
require( 'cmp' )
--require('nvim-cmp')
--require('cmp_luasnip')

---- automatically detect which servers to install (based on which servers are set up via lspconfig)
require('mason').setup({
   -- automatic_installation = true, 
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})


-- Tree-sitter configuration
require('user.bufferline')
require('nvim-treesitter').setup {}
require('orgmode').setup_ts_grammar({
--require('orgmode').setup({
  org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/Dropbox/org/refile.org',
})

require ( 'user.toggleterm')
require ( 'user.gitsigns' )



