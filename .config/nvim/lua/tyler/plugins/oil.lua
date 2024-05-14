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
				["<C-s>"] = "<cmd>w<cr>",
				["<C-h>"] = {
					function()
						local harpoon = require("harpoon")
						harpoon:setup()
						harpoon:list():select(1)
					end,
				},
			},
		})
		vim.keymap.set("n", "<leader>-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
		vim.keymap.set("n", "-", require("oil").open_float)
	end,
}
