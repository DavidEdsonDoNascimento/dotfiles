return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		build = ":TSUpdate",
		event = { "VeryLazy" },
		version = false,
		config = function()
			local opts = {}
			opts.ensure_installed = {
				"css",
				"dockerfile",
				"javascript",
				"typescript",
				"python",
				"elm",
				"fish",
				"gitcommit",
				"html",
				"http",
				"json",
				"lua",
				"regex",
				"rust",
				"scss",
				"toml",
				"yaml",
				"svelte",
				"gitignore",
				"graphql",
				"sql",
				"vim",
			}
			opts.sync_install = true
			opts.highlight = { enable = true }
			opts.indent = { enable = true }
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
