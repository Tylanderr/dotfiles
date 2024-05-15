return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				-- overwrite default keymaps with custom functions
				["<C-s>"] = false,
				["<C-h>"] = false,
			},
		})
		vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
		vim.keymap.set("n", "<leader>-", require("oil").open_float)
	end,
}
