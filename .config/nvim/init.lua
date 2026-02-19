-- ============================================
-- Configuration Neovim avec autocomplétion ============================================

-- Options de base
-- Désactiver les fichiers swap (éviter les messages d'avertissement)
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.number = true              -- Numéros de ligne
vim.opt.relativenumber = true      -- Numéros relatifs
vim.opt.mouse = 'a'                -- Activer la souris
vim.opt.ignorecase = true          -- Recherche insensible à la casse
vim.opt.smartcase = true           -- Sauf si maj dans recherche
vim.opt.hlsearch = false           -- Pas de surbrillance recherche
vim.opt.wrap = true                -- Retour à la ligne
vim.opt.breakindent = true         -- Indentation sur retour ligne
vim.opt.tabstop = 2                -- Taille des tabulations
vim.opt.shiftwidth = 2             -- Taille indentation
vim.opt.expandtab = true           -- Espaces au lieu de tabs
vim.opt.termguicolors = true       -- Couleurs 24-bit
vim.opt.signcolumn = "yes"         -- Toujours afficher colonne signes

-- Leader key (pour raccourcis personnalisés)
vim.g.mapleader = ' '              -- Espace comme touche leader

-- ============================================
-- Installation de lazy.nvim (gestionnaire de plugins)
-- ============================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- ============================================
-- Configuration des plugins
-- ============================================
require("lazy").setup({
  
  -- Thème moderne et élégant
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },

  -- Explorateur de fichiers
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end,
  },

  -- Recherche floue de fichiers
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.5',
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Ligne de status améliorée
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'tokyonight'
        }
      })
    end,
  },

  -- Coloration syntaxique améliorée (désactivé - incompatibilité)
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   build = ":TSUpdate",
  --   config = function()
  --     require("nvim-treesitter.configs").setup({
  --       ensure_installed = { "lua", "vim", "python", "javascript", "html", "css", "json" },
  --       highlight = { enable = true },
  --       indent = { enable = true },
  --     })
  --   end,
  -- },

  -- ============================================
  -- AUTOCOMPLÉTION
  -- ============================================
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",      -- Source LSP
      "hrsh7th/cmp-buffer",         -- Mots du buffer
      "hrsh7th/cmp-path",           -- Chemins de fichiers
      "hrsh7th/cmp-cmdline",        -- Ligne de commande
      "L3MON4D3/LuaSnip",           -- Moteur de snippets
      "saadparwaiz1/cmp_luasnip",   -- Source snippets pour cmp
      "rafamadriz/friendly-snippets", -- Collection de snippets
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Charger les snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        
        -- Mappings clavier
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter pour valider
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        
        -- Sources d'autocomplétion (ordre = priorité)
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },    -- LSP
          { name = 'luasnip' },     -- Snippets
        }, {
          { name = 'buffer' },      -- Mots du fichier
          { name = 'path' },        -- Chemins
        })
      })

      -- Autocomplétion pour la ligne de commande
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end,
  },

  -- Support LSP (Language Server Protocol) pour autocomplétion avancée
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Configuration sera ajoutée selon tes besoins
    end,
  },

  -- Commentaires faciles
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },

  -- Paires automatiques de parenthèses, guillemets, etc.
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
      -- Intégration avec nvim-cmp
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end,
  },

  -- Indentation visible
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup()
    end,
  },

})

-- ============================================
-- Raccourcis clavier
-- ============================================

-- Explorateur de fichiers
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })

-- Telescope (recherche)
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Buffers' })

-- Navigation entre buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Previous buffer' })

-- Sauvegarder avec Ctrl+S
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save' })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a', { desc = 'Save' })

-- Quitter
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })

-- Annuler la recherche en appuyant sur Esc
vim.keymap.set('n', '<Esc>', ':noh<CR>', { desc = 'Clear search' })

-- ============================================
-- Raccourcis style "éditeur classique"
-- ============================================

-- Ctrl+A : Tout sélectionner
vim.keymap.set('n', '<C-a>', 'ggVG', { desc = 'Select all' })

-- Ctrl+C : Copier (en mode visuel)
vim.keymap.set('v', '<C-c>', '"+y', { desc = 'Copy to clipboard' })

-- Ctrl+X : Couper (en mode visuel)
vim.keymap.set('v', '<C-x>', '"+d', { desc = 'Cut to clipboard' })

-- Ctrl+V : Coller
vim.keymap.set('n', '<C-v>', '"+p', { desc = 'Paste from clipboard' })
vim.keymap.set('i', '<C-v>', '<C-r>+', { desc = 'Paste from clipboard' })
vim.keymap.set('v', '<C-v>', '"+p', { desc = 'Paste from clipboard' })

-- Ctrl+Z : Annuler
vim.keymap.set('n', '<C-z>', ':undo<CR>', { desc = 'Undo' })
vim.keymap.set('i', '<C-z>', '<Esc>:undo<CR>a', { desc = 'Undo' })

-- Ctrl+Y : Refaire
vim.keymap.set('n', '<C-y>', ':redo<CR>', { desc = 'Redo' })
vim.keymap.set('i', '<C-y>', '<Esc>:redo<CR>a', { desc = 'Redo' })

-- Ctrl+F : Rechercher
vim.keymap.set('n', '<C-f>', '/', { desc = 'Search' })

-- Ctrl+H : Rechercher et remplacer
vim.keymap.set('n', '<C-h>', ':%s/', { desc = 'Search and replace' })

-- ============================================
-- Messages de bienvenue
-- ============================================
-- print("✨ Neovim configuré avec succès!")
-- print("💡 Appuie sur <Espace>e pour ouvrir l'explorateur de fichiers")
-- print("💡 Appuie sur <Espace>ff pour rechercher un fichier")
-- print("💡 L'autocomplétion fonctionne automatiquement!")
