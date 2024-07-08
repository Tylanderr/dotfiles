return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			default_file_explorer = false,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				-- overwrite default keymaps with custom functions
				["<C-s>"] = false,
				["<C-h>"] = false,
				["<C-j>"] = false,
				["<C-k>"] = false,
				["<C-l>"] = false,
			},
			float = {
				padding = 2,

				max_width = 225,
				max_height = 60,
				border = "rounded",
				win_options = {
					winblend = 0,
				},
				override = function(conf)
					return conf
				end,
			},
		})
		vim.keymap.set("n", "-", require("oil").open_float)
	end,
}
