local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettier" },
		javascript = { "prettier" },
		html = { "prettier" },
		json = { "jq" },
		python = { "black" },
		sh = { "beautysh" },
		bash = { "beautysh" },
		zsh = { "beautysh" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
}

return options
