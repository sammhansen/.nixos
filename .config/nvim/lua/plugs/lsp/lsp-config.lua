local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
	bashls = {},
	clangd = {},
	gopls = {
		settings = {
			gopls = {
				semanticTokens = true,
				analyses = { unusedparams = true },
				staticcheck = true,
				hints = {
					assignVariableTypes = false,
					compositeLiteralFields = false,
					compositeLiteralTypes = false,
					constantValues = false,
					functionTypeParameters = false,
					parameterNames = false,
					rangeVariableTypes = false,
				},
			},
		},
	},
	jsonls = {},
	lua_ls = {
		settings = {
			Lua = {
				workspace = { checkThirdParty = false },
				completion = { callSnippet = "Replace" },
			},
		},
	},
	nixd = {},
	pyright = {
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
					typeCheckingMode = "basic",
					diagnosticMode = "openFilesOnly",
				},
			},
		},
	},
	ruff = {},
	terraformls = {},
	tflint = {},
	yamlls = { settings = { yaml = { keyOrdering = false } } },
	ts_ls = { settings = { completions = { completeFunctionCalls = true } } },
	rust_analyzer = {},
}

for server, config in pairs(servers) do
	config.capabilities = capabilities
	lspconfig[server].setup(config)
end
