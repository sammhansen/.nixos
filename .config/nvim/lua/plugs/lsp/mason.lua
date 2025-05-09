return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			local mason = require("mason")

			mason.setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"markdownlint",
					"isort",
					"black",
					"shfmt",
					"rustfmt",
				},

				ui = {
					icons = {
						package_pending = " ",
						package_installed = " ",
						package_uninstalled = "󰚌",
					},

					keymaps = {
						toggle_server_expand = "<CR>",
						install_server = "i",
						update_server = "u",
						check_server_version = "c",
						update_all_servers = "U",
						check_outdated_servers = "C",
						uninstall_server = "X",
						cancel_installation = "<C-c>",
					},
				},
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"pyright",
					"bashls",
					"ts_ls",
					"jsonls",
					"pylsp",
					"tflint",
					"yamlls",
					"vimls",
					"emmet_language_server",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			require("plugs.lsp.lsp-config")
		end,
	},
}
