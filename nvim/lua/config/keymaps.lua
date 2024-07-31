local api = vim.api
local opts = { noremap = true, silent = true }
local mappings = {
	{ "n", "x", '"_x', opts },
	-- Increment/decrement
	{ "n", "+", "<C-a>", opts },
	{ "n", "-", "<C-x>", opts },
	{ "n", "<leader>lc", ":source ~/.config/nvim/", { noremap = true } },
	-- go to the end of the line
	{ "i", "jf", "<esc>$i<Right>", opts },
	{ "n", "JF", "$i<Right>", opts },
	-- Select all
	{ "n", "<C-a>", "gg<S-v>G", opts },
	-- Explorer Ntree
	{ "n", "<leader>pv", "<cmd>Ex<CR>", opts },
	{ "n", "<Leader>t", ":NvimTreeToggle<Return>", opts },
	-- move a block of text up or down
	{ "v", "K", ":m '<-2<CR>gv=gv", opts },
	{ "v", "J", ":m '>+1<CR>gv=gv", opts },
	-- Save file and quit
	{ "n", "<Leader>w", ":update<Return>", opts },
	{ "n", "<Leader>q", ":quit<Return>", opts },
	-- Lazy UI
	{ "n", "TL", ":Lazy<Return>", opts },
	{ "n", "TM", ":Mason<Return>", opts },
	{ "n", "TG", ":MasonLog<Return>", opts },
	-- return to Normal Mode
	{ "i", "jk", "<esc>l", opts },
	-- return line up in insert mode
	{ "i", "kj", "<esc>ki", opts },
	-- New File
	{ "n", "<C-n>", "<cmd>enew<cr>", opts },
	-- Tabs
	{ "n", "te", ":tabedit<Return>", opts },
	{ "n", "<tab>", ":tabnext<Return>", opts },
	{ "n", "<s-tab>", ":tabprev<Return>", opts },
	{ "n", "tq", ":tabclose<Return>", opts },
	-- Split window
	{ "n", "ss", ":split<Return>", opts },
	{ "n", "sv", ":vsplit<Return>", opts },
	-- New split vertical with nvim-config
	{ "n", "ke", ":split ~/.config/nvim/lua/config/keymaps.lua<Return>", opts },
	-- Buffers
	{ "n", "<leader>zz", "<cmd>bp<CR>", opts },
	{ "n", "<leader>za", "<cmd>bn<CR>", opts },
	{ "n", "<leader>zd", "<cmd>bd<CR>", opts },
	{ "n", "<leader>ZA", "<cmd>bufdo bw<CR>", opts },
	{ "n", "<leader>zw", "<cmd>bw<CR>", opts },
	-- Add empty line
	{ "n", "op", "o<esc>k", opts },
	{ "n", "oi", "O<esc>j", opts },
	{ "n", "oo", "A<Return>", opts },
	-- Move window
	{ "n", "<leader>h", "<C-w>h<CR>", opts },
	{ "n", "<leader>k", "<C-w>k<CR>", opts },
	{ "n", "<leader>j", "<C-w>j<CR>", opts },
	{ "n", "<leader>l", "<C-w>l<CR>", opts },
	{ "n", "<leader>Q", "<C-w>c<CR>", opts },
	-- Resize window
	{ "n", "<C-S-h>", "<C-w><", opts },
	{ "n", "<C-S-l>", "<C-w>>", opts },
	{ "n", "<C-S-k>", "<C-w>+", opts },
	{ "n", "<C-S-j>", "<C-w>-", opts },
}

for _, val in pairs(mappings) do
	api.nvim_set_keymap(unpack(val))
end
