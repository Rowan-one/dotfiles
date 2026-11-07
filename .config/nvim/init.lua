require("config.lazy")
require("config.keys")

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.defer_fn(function()
			local scheme = "onedark_vivid"
			if scheme then
				vim.cmd("colorscheme " .. scheme)
			end
			-- -- reapply custom highlights after colorscheme
			-- local palette = require("monokai").classic
			-- vim.api.nvim_set_hl(0, "@property", { fg = palette.orange })
			-- vim.api.nvim_set_hl(0, "@field", { fg = palette.orange })
			-- vim.api.nvim_set_hl(0, "@tag", { fg = palette.green })
			-- vim.api.nvim_set_hl(0, "@tag.builtin.tsx", { fg = palette.green })
			-- vim.api.nvim_set_hl(0, "@tag.delimiter.tsx", { fg = palette.white })
			-- vim.api.nvim_set_hl(0, "@tag.attribute.tsx", { fg = palette.aqua })
		end, 50)
	end,
})

vim.filetype.add({
	extension = {
		tsx = "typescriptreact",
		jsx = "javascriptreact",
	},
})

require("transparent").setup({})

-- Config
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.wrap = false
vim.lsp.inlay_hint.enable(false)
vim.opt.list = true
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option("updatetime", 300)
vim.opt.listchars = { tab = "··", space = " ", trail = "·" }
