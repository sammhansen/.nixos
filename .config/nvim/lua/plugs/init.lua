require("plugs.strap")
require("plugs.ui")

local lazy = require("lazy")
lazy.setup({
	{
		"echasnovski/mini.starter",
		config = function()
			require("plugs.utils.mini-starter")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		lazy = true,
		dependencies = { "plenary.nvim" },
		config = function()
			require("plugs.utils.telescope")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},
	{
		require("plugs.utils.avante"),
	},
	{
		require("plugs.utils.snacks"),
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		lazy = true,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("lualine").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		-- loads treesitter only while reading a file or creating a new one
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugs.utils.treesitter")
		end,
	},

	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },

		version = "*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = require("plugs.lsp.blink"),
	},

	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			require("plugs.lsp.lsp-config") -- Load your LSP config
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("plugs.utils.conform")
		end,
	},
	{
		"echasnovski/mini.pairs",
		version = false,
		config = function()
			require("plugs.utils.mini-pairs")
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("plugs.utils.nvim-ts-autotag")
		end,
	},
	{
		"echasnovski/mini.comment",
		version = false,
		config = function()
			require("plugs.utils.mini-comment")
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("plugs.utils.noice")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("plugs.ui.catppuccin")
		end,
	},

	{
		"wakatime/vim-wakatime",
		lazy = false,
	},
	{
		"andweeb/presence.nvim",
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},

	ui = {
		size = { width = 0.8, height = 0.8 },
		border = "solid",
		icons = {
			cmd = " ",
			config = "",
			event = "",
			ft = " ",
			init = " ",
			import = " ",
			keys = " ",
			lazy = "鈴 ",
			loaded = "●",
			not_loaded = "○",
			plugin = " ",
			runtime = " ",
			source = " ",
			start = "",
			task = "✔ ",
			list = { "●", "➜", "★", "‒" },
		},
		throttle = 20,
	},
	defaults = { lazy = true },
	performance = {
		cache = {
			enabled = true,
			path = vim.fn.stdpath("cache") .. "/lazy/cache",
			ttl = 3600 * 24 * 5,
			disable_events = { "VimEnter", "BufReadPre", "UIEnter" },
		},
		reset_packpath = true,
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"logipat",
				"matchit",
				"matchparen",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"logipat",
				"matchit",
				"tutor",
				"rplugin",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"ftplugin",
				"archlinux",
				"fzf",
				"tutor_mode_plugin",
				"sleuth",
				"vimgrep",
			},
		},
	},
})
