return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		require("bufferline").setup({
			options = {
				separator_style = "slant",
				duplicates_across_groups = false,
				indicator = {
					style = "underline",
				},
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or " ")
						s = s .. n .. sym
					end
					return s
				end,
				groups = {
					options = {
						toggle_hidden_on_enter = true,
					},
					items = {
						{
							name = "Client",
							matcher = function(buf)
								return buf.path:match("/src/client/") ~= nil
							end,
						},
						{
							name = "Server",
							matcher = function(buf)
								return buf.path:match("/src/server/") ~= nil
							end,
						},
						{
							name = "Shared",
							matcher = function(buf)
								return buf.path:match("/src/shared/") ~= nil
							end,
						},
					},
				},
			},
			highlights = {
				group_label = { fg = "#f8f8f0", bg = "#333842" },
				group_separator = { fg = "#333842" },
			},
		})
	end
}
