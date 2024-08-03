#!/bin/bash

if ! command -v nvim &>/dev/null; then
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz

    mkdir -p $HOME/.opt $HOME/.local/bin
    rm -rf $HOME/.opt/nvim-linux64

    tar -C $HOME/.opt -xzf nvim-linux64.tar.gz
    rm -rf nvim-linux64.tar.gz

    rm -rf $HOME/.local/bin/nvim
    ln -s $HOME/.opt/nvim-linux64/bin/nvim $HOME/.local/bin/nvim

    if ! grep -q '.local/bin' $HOME/.bashrc; then
        echo 'export PATH=$HOME/.local/bin:$PATH' >>$HOME/.bashrc
    fi
    if ! grep -q '.local/bin' $HOME/.zshrc; then
        echo 'export PATH=$HOME/.local/bin:$PATH' >>$HOME/.zshrc
    fi
fi

rm -rf ~/.config/nvchad ~/.local/share/nvchad
mkdir -p ~/.config/nvchad ~/.local/bin

cat <<'EOF' >~/.local/bin/nvchad
#!/usr/bin/env bash

( NVIM_APPNAME=nvchad nvim $@ )
EOF
chmod +x ~/.local/bin/nvchad

git clone https://github.com/NvChad/starter ~/.config/nvchad
rm -rf ~/.config/nvchad/.git

cat <<'EOF' >~/.config/nvchad/lua/mappings.lua
require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set
local del = vim.keymap.del

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- insert mode
map("i", "jj", "<Esc>", { silent = true })
-- map("t", "jj", "<C-\\><C-n>", { silent = true })
map("t", "<Esc>", "<C-\\><C-n>", { silent = true })

-- files
map("n", "<leader><space>", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<leader>fs", "<cmd>w<cr>", { noremap = true, desc = "save buffer" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>cd", "<cmd>cd %:p:h<cr>", { noremap = true, desc = "cd to this file" })
map("n", "<leader>qq", "<cmd>qa<cr>", { noremap = true, desc = "quit" })
map("n", "<leader>/", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })

-- buffers
map("n", "<leader><tab>", "<cmd>b#<cr>", { noremap = true, desc = "previously active buffer" })
map("n", "<leader>bb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>bo", "<cmd>%bd|e#|bd#<cr>", { noremap = true, desc = "delete other buffers" })

map("n", "L", function()
	require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "H", function()
	require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>bn", function()
	require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<leader>bp", function()
	require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>bd", function()
	require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

map("n", "<leader>bk", function()
	require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- windows
map("n", "<leader>ww", "<C-w><C-w>", { desc = "cycle windows" })
map("n", "<leader>wo", "<C-w>o", { noremap = true, desc = "delete other windows" })
map("n", "<leader>wd", "<C-w>q", { desc = "close window" })
map("n", "<leader>wq", "<C-w>q", { desc = "close window" })
map("n", "<leader>wo", "<C-w>o", { desc = "close other windows" })
map("n", "<leader>ws", "<C-w>s", { desc = "split window horisontally" })
map("n", "<leader>wh", "<C-w>s", { desc = "split window horisontally" })
map("n", "<leader>wv", "<C-w>v", { desc = "split window vertically" })
map("n", "<leader>w=", "<C-w>=", { desc = "make window sizes equal" })
map("n", "<C-left>", "<cmd>vert res -2<cr>")
map("n", "<C-right>", "<cmd>vert res +2<cr>")
map("n", "<C-down>", "<cmd>res -2<cr>")
map("n", "<C-up>", "<cmd>res +2<cr>")
map({ "n", "v" }, "<C-h>", "<C-w>h", { desc = "switch window left" })
map({ "n", "v" }, "<C-l>", "<C-w>l", { desc = "switch window right" })
map({ "n", "v" }, "<C-j>", "<C-w>j", { desc = "switch window down" })
map({ "n", "v" }, "<C-k>", "<C-w>k", { desc = "switch window up" })
map("i", "<C-h>", "<esc><C-w>h", { desc = "switch window left" })
map("i", "<C-l>", "<esc><C-w>l", { desc = "switch window right" })
map("i", "<C-j>", "<esc><C-w>j", { desc = "switch window down" })
map("i", "<C-k>", "<esc><C-w>k", { desc = "switch window up" })
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "switch window left" })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "switch window right" })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "switch window down" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "switch window up" })

-- Emacs-like --
--- Navigation
map("!", "<C-b>", "<Left>", { silent = true })
map("!", "<C-f>", "<Right>", { silent = true })
map("i", "<C-p>", "<Up>", { silent = true })
map("i", "<C-n>", "<Down>", { silent = true })
map("!", "<C-a>", "<Home>", { silent = true })
map("!", "<C-e>", "<End>", { silent = true })
map("i", "<M-a>", "<C-o>(", { silent = true })
map("i", "<M-e>", "<C-o>)", { silent = true })
map("i", "<M-b>", "<C-Left>", { silent = true })
map("c", "<M-b>", "<S-Left>", { silent = true })
map("i", "<M-f>", "<C-o>e<Right>", { silent = true })
map("c", "<M-f>", "<S-Right>", { silent = true })
map("i", "<M-v>", "<PageUp>", { silent = true })
map("i", "<C-v>", "<PageDown>", { silent = true })
--- Copy & Paste
--- Editing
map("!", "<C-d>", "<Del>", { silent = true })
map("!", "<M-BS>", "<C-w>", { silent = true })
map("i", "<C-BS>", "<C-w>", { silent = true })
map("i", "<C-k>", function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  if #line <= col then
    return "<Del><C-o>dw"
  end
  return "<C-o>dw"
end, { silent = true, expr = true })
map("c", "<C-k>", "<C-f>d$<C-c><End>", { silent = true })
map("i", "<M-d>", function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  if #line <= col then
    return "<Del>"
  end
  return "<C-o>d$"
end, { silent = true, expr = true })
map("i", "<M-k>", "<C-o>d)", { silent = true })
--- Run command
map("t", "<M-x>", "<C-\\><C-n>:")
map("i", "<M-x>", "<Esc>:")
map({ "n", "v" }, "<M-x>", ":")
--- Run external command
map("i", "<M-!>", "<Esc>:!")
map("n", "<M-!>", ":!")

-- plugins
-- iron
-- map("n", "<leader>ris", function()
-- 	require("iron.nvim").IronRepl()
-- end, { desc = "start REPL" })
-- gen.nvim
map({ "n", "v" }, "<leader>oo", ":Gen<CR>")
map({ "n", "v" }, "<leader>ol", ":lua require('gen').select_model()<CR>")
-- lazygit
map({ "n", "v" }, "<leader>gg", ":LazyGitCurrentFile<CR>")
-- lazy
map({ "n", "v" }, "<leader>l", ":Lazy<CR>")

-- overridings
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
del("n", "<leader>b")
EOF

cat <<'EOF' >~/.config/nvchad/lua/configs/lspconfig.lua
-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "pyright", "bashls", "marksman" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- }
EOF

cat <<'EOF' >~/.config/nvchad/lua/configs/conform.lua
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
EOF

cat <<'EOF' >~/.config/nvchad/lua/plugins/init.lua
return {
	{
		"stevearc/conform.nvim",
		-- event = "BufWritePre", -- uncomment for format on save
		opts = require("configs.conform"),
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
				"css",
				"html",
				"ini",
				"json",
				"lua",
				"markdown",
				"org",
				"python",
				"toml",
				"vim",
				"vimdoc",
				"yaml",
			},
		},
	},
}
EOF

cat <<'EOF' >~/.config/nvchad/lua/chadrc.lua
-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "everblush",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

return M
EOF
