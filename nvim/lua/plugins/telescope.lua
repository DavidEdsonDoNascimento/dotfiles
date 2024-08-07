return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-lua/plenary.nvim",
			"kkharji/sqlite.lua",
		},
		config = function()
			require("telescope").setup({
				extensions = {
					wrap_results = true,
					fzf = {},
					history = {
						path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
						limit = 100,
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "smart_history")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files)
			vim.keymap.set("n", "<leader>fg", builtin.git_files)
			vim.keymap.set("n", "<leader>ft", builtin.help_tags)
			vim.keymap.set("n", "<leader>f/", builtin.live_grep)
			vim.keymap.set("n", "<leader>fb", builtin.current_buffer_fuzzy_find)
			vim.keymap.set("n", "<leader>fw", builtin.grep_string)
			vim.keymap.set("n", "<leader>fa", function()
				---@diagnostic disable-next-line: param-type-mismatch
				builtin.find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") })
			end)
			vim.keymap.set("n", "<leader>ke", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "files vim conf." })
			vim.keymap.set("n", "<leader>kb", function()
				builtin.find_files({ cwd = "~/.config/nvim-backup/" })
			end)
		end,
	},
}
