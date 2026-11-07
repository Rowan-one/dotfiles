return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = {
				"lua",
				"luau",
				"rust",
				"wgsl",
				"tsx",
				"typescript",
			},

			sync_install = false,
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			indent = {
				enable = true,
			}
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "wgsl", "rust", "luau", "lua", "typescript", "typescriptreact" },
			callback = function()
				vim.treesitter.start()
			end,
		})

		-- Treesitter folding
		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
	end
}
