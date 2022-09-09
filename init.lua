vim.g.mapleader = "<SPACE>"
vim.g.localleader = "\\"

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plug')      -- Plugins
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

require('which-key').setup{}
require('nvim-autopairs').setup{}

--lsp config
--local lspconfig = require'lspconfig'
--local completion = require'completion'
--local function custom_on_attach(client)
  --print('Attaching to ' .. client.name)
  --completion.on_attach(client)
--end
--local default_config = {
  --on_attach = custom_on_attach,
--}

--nvim-lsp-installer
---- automatically detect which servers to install (based on which servers are set up via lspconfig)
require('nvim-lsp-installer').setup({
    automatic_installation = true, 
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
-- setup language servers here
--lspconfig.tsserver.setup(default_config)
require'lspconfig'.pyright.setup{}
require'lspconfig'.bashls.setup{}

--require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration

require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  ensure_installed = {'org'},-- and run :TSUpdate org
}
require('orgmode').setup_ts_grammar({
--require('orgmode').setup({
  org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/Dropbox/org/refile.org',
})

