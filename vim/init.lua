if vim.fn.has('nvim-0.12') == 0 then
  vim.notify('This config requires Neovim 0.12+', vim.log.levels.ERROR)
  return
end

-- Leader must be set before any plugin is loaded.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local o = vim.o

-- Only options that differ from Neovim's defaults are set here.

-- UI
o.number = true
o.relativenumber = true
o.scrolloff = 5
o.colorcolumn = '80'
o.signcolumn = 'yes'        -- reserve the gutter so it never jumps
o.cursorline = true
o.termguicolors = true      -- required by solarized.nvim
o.winborder = 'rounded'
o.splitright = true
o.splitbelow = true
o.confirm = true
o.updatetime = 250          -- default 4000ms makes LSP feel broken

-- Whitespace
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.shiftround = true
o.list = true
o.listchars = 'tab:  ,trail:.,extends:>,precedes:<,nbsp:+'

-- Searching
o.ignorecase = true
o.smartcase = true

o.swapfile = false
o.backup = false
o.writebackup = false
o.undofile = true

o.clipboard = 'unnamed'

-- Project-local config: reads .nvim.lua/.nvimrc/.exrc, but only after :trust.
o.exrc = true

vim.opt.wildignore:append({
  '*.o',
  '*.out',
  '*.obj',
  '*.pyc',
  '*.class',
  '*.gem',
  '*.rbc',
  '*.rbo',
  '.git',
  '.svn',
  '*.png',
  '*.jpg',
  '*.gif',
  '*/node_modules/*',
  '*/.venv/*',
  '*/dist/*',
  '*.zip',
  '*.tar.gz',
  '*.tar.bz2',
  '*.rar',
  '*.tar.xz',
})

-- Plugins

local gh = function(repo) return 'https://github.com/' .. repo end

-- Parsers must be rebuilt when nvim-treesitter is updated or they fall out of
-- sync with its queries. First installs are covered by install() below.
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name ~= 'nvim-treesitter' or ev.data.kind ~= 'update' then
      return
    end
    vim.schedule(function()
      -- The hook can fire before the plugin is on the runtimepath.
      if not ev.data.active then
        vim.cmd.packadd('nvim-treesitter')
      end
      require('nvim-treesitter').update()
    end)
  end,
})

vim.pack.add({
  gh('maxmx03/solarized.nvim'),
  gh('catgoose/nvim-colorizer.lua'),

  -- 'main' is pinned deliberately: the master branch is a different API.
  { src = gh('nvim-treesitter/nvim-treesitter'), version = 'main' },
  gh('neovim/nvim-lspconfig'),

  gh('ibhagwan/fzf-lua'),
  gh('folke/flash.nvim'),

  gh('tpope/vim-fugitive'),

  -- Filetypes not covered by treesitter
  gh('elixir-editors/vim-elixir'),
  gh('chr4/nginx.vim'),
  gh('marteinn/Vaja-Vim'),
})

o.background = 'dark'
require('solarized').setup({})
vim.cmd.colorscheme('solarized')

require('colorizer').setup({ user_default_options = { css = true, tailwind = true } })

-- Treesitter

local parsers = {
  'bash',
  'css',
  'eex',
  'elixir',
  'heex',
  'html',
  'javascript',
  'json',
  'jsdoc',
  'lua',
  'markdown',
  'markdown_inline',
  'php',
  'python',
  'query',
  'scss',
  'toml',
  'tsx',
  'typescript',
  'vim',
  'vimdoc',
  'yaml',
}

local installed = require('nvim-treesitter.config').get_installed('parsers')
local missing = vim.tbl_filter(function(p)
  return not vim.tbl_contains(installed, p)
end, parsers)

if #missing > 0 then
  require('nvim-treesitter').install(missing)
end

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Enable treesitter highlighting where a parser is available',
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if not lang then
      return
    end
    -- language.add() reports a missing parser by returning false, not by
    -- raising, so the return value has to be checked or start() will throw.
    local ok, added = pcall(vim.treesitter.language.add, lang)
    if ok and added then
      vim.treesitter.start(ev.buf, lang)
    end
  end,
})

-- Treesitter indent is left off: still experimental upstream, and worse than
-- the ftplugin indent Neovim already ships for these languages.

-- LSP

-- Server configurations come from nvim-lspconfig's lsp/ directory; only
-- overrides live here.
vim.lsp.config('basedpyright', {
  settings = {
    basedpyright = {
      analysis = { typeCheckingMode = 'standard' },
    },
  },
})

vim.lsp.enable({
  'basedpyright',   -- python  : uv tool install basedpyright
  'ruff',           -- python  : uv tool install ruff
  'vtsls',          -- js/ts   : npm i -g @vtsls/language-server
  'eslint',         -- js/ts   : npm i -g vscode-langservers-extracted
  'cssls',          -- css     :  "
  'html',           -- html    :  "
  'jsonls',         -- json    :  "
  'intelephense',   -- php     : npm i -g intelephense
  'elixirls',       -- elixir  : brew install elixir-ls
})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Enable built-in completion when a language server attaches',
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, { autotrigger = true })
    end
  end,
})

-- K, grn, gra, grr, gri, grt, ]d and [d are Neovim defaults; these are aliases.
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, { desc = 'Go to type definition' })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })

vim.api.nvim_create_user_command('Format', function()
  vim.lsp.buf.format({ async = true })
end, { desc = 'Format the current buffer via LSP' })

-- Keymaps

local map = vim.keymap.set

map('n', '<leader><CR>', ':wa<CR>:!!<CR>', { desc = 'Save all and repeat last shell command' })

map('n', '<leader>p', '<C-^>', { desc = 'Previous buffer' })
map('n', '<leader>s', '<Cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })
map('n', 'gV', '`[v`]', { desc = 'Select last inserted text' })
map('n', '-', '<Cmd>Explore<CR>', { desc = 'Open netrw in the current directory' })

require('fzf-lua').setup({ 'default' })

map('n', '<C-p>', '<Cmd>FzfLua files<CR>', { desc = 'Find files' })
map('n', '<leader>b', '<Cmd>FzfLua buffers<CR>', { desc = 'Find buffers' })
map('n', '<leader>f', '<Cmd>FzfLua live_grep<CR>', { desc = 'Grep in project (ripgrep)' })

require('flash').setup({
  labels = 'qwertyuiopåasdfghjklöäzxcvbnm',
})

-- `s` shadows the built-in substitute; `cl` does the same job.
map({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end, { desc = 'Flash jump' })
map({ 'n', 'x', 'o' }, 'S', function() require('flash').treesitter() end, { desc = 'Flash treesitter' })
map('o', 'r', function() require('flash').remote() end, { desc = 'Flash remote' })
map({ 'x', 'o' }, 'R', function() require('flash').treesitter_search() end, { desc = 'Flash treesitter search' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Briefly highlight yanked text',
  callback = function() vim.hl.on_yank() end,
})

o.statusline = '%.50f [%{exists("*FugitiveHead")?FugitiveHead():""}] %r %= %c%V | %y %l/%L'

local extra = vim.fs.normalize('~/.nvim_extra.lua')
if vim.uv.fs_stat(extra) then
  dofile(extra)
end
