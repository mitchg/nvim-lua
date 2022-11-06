vim.g.mapleader = "<SPACE>"
vim.g.localleader = "\\"
vim.g.completion_enable_snippet = 'snippets.nvim'
vim.opt.termguicolors = true
--first change for BR1 Branch
-- IMPORTS
require('user.vars')      -- Variables
require('user.opts')      -- Options
require('user.keys')      -- Keymaps
require('user.plug')      -- Plugins

-- PLUGINS: ADD this section
require("startup").setup({theme = "startify"})
require('nvim-tree').setup{}

require('onedark').setup {
   style = 'deep' 
}
require('onedark').load()
 
--Status Line
require('lualine').setup {
  options = {
    theme = 'onedark'}
}
--require( 'luasnip' )
require( 'luasnip.loaders.from_vscode' ).lazy_load()
require( 'which-key' ).setup{}
require( 'nvim-autopairs' ).setup{}
require( 'telescope')
require( 'cmp' )

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
require('bufferline').setup{}
require('nvim-treesitter').setup {}

require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}
 
--"require('orgmo
--de').setup_ts_grammar()" and run :TSUpdate org. 

require('orgmode').setup({
--require('orgmode').setup({
  org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/Dropbox/org/refile.org',
})

require ( 'user.toggleterm')
require ( 'user.gitsigns' )



