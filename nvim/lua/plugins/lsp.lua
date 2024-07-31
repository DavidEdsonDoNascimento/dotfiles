return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"stevearc/conform.nvim",
			"b0o/SchemaStore.nvim",
		},
		config = function()
			-- Mason
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
			-- Setup mason-lspconfig
			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = {
					"bashls",
					"lua_ls",
					"rust_analyzer",
					"clangd",
					"dockerls",
					"docker_compose_language_service",
					"eslint",
					"html",
					"marksman",
					"pyright",
					"ruff_lsp",
					"graphql",
					"angularls",
					"sqlls",
					"somesass_ls",
					"tailwindcss",
					"cssls",
					"biome",
					"volar",
					"jsonls",
					"yamlls",
					"prismals",
				},
			})
			-- Setup mason-tool-installer
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"prettier",
					"eslint_d",
				},
				auto_update = true,
				run_on_start = true,
			})

			local capabilities = nil

			if pcall(require, "cpm_nvim_lsp") then
				capabilities = require("cmp_nvim_lsp").default_capabilities()
			end

			local on_attach = function(client, bufnr)
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
			end

			local servers = {
				bashls = {},
				lua_ls = {},
				rust_analyzer = {},
				clangd = {},
				dockerls = {},
				docker_compose_language_service = {},
				eslint = {},
				html = {},
				marksman = {},
				pyright = {},
				ruff_lsp = {},
				graphql = {},
				angularls = {},
				sqlls = {},
				somesass_ls = {},
				tailwindcss = {},
				cssls = {},
				biome = {},
				volar = {},
				jsonls = {
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = { enable = true },
						},
					},
				},
				yamlls = {
					settings = {
						yaml = {
							schemaStore = {
								enable = false,
								url = "",
							},
							schemas = require("schemastore").yaml.schemas(),
						},
					},
				},
				prismals = {},
			}

			for server, config in pairs(servers) do
				require("lspconfig")[server].setup(vim.tbl_extend("force", {
					capabilities = capabilities,
					on_attach = on_attach,
				}, config))
			end
		end,
	},
}
