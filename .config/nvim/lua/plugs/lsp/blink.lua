return {
	opts = {
		keymap = {
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide" },
			["<Tab>"] = { "select_and_accept" },

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<M-q>"] = { "select_prev", "fallback" },
			["<M-w>"] = { "select_next", "fallback" },

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },

			["<M-s>"] = { "snippet_forward", "fallback" },
			["<M-a>"] = { "snippet_backward", "fallback" },

			["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		completion = {
			menu = { border = "rounded" },
			documentation = { window = { border = "rounded" } },
		},

		cmdline = {
			keymap = {
				["<Tab>"] = { "show", "accept" },
			},
			completion = { menu = { auto_show = true } },
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
