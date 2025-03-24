local lspconfig = require("lspconfig")

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
}

-- Loop through the servers and set them up
for server, config in pairs(servers) do
	lspconfig[server].setup(config)
end
