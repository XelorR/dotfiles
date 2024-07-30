require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("i", "jj", "<Esc>", { silent = true })
map("t", "jj", "<C-\\><C-n>", { silent = true })
map("t", "<Esc>", "<C-\\><C-n>", { silent = true })
map("n", "<leader>fs", "<cmd>w<cr>", { noremap = true, desc = "Save buffer" })
map("n", "<leader>cd", "<cmd>cd %:p:h<cr>", { noremap = true, desc = "cd to this file" })
map("n", "<leader>wo", "<C-w>o", { noremap = true, desc = "Delete other windows" })
map("n", "<leader>qq", "ZQ", { noremap = true, desc = "Quit" })
map("i", "<M-x>", "<Esc>:")
map("n", "<M-x>", ":")
map({ "n", "v" }, "H", "<cmd>bp!<cr>")
map({ "n", "v" }, "L", "<cmd>bn!<cr>")
map("n", "<leader>bp", "<cmd>bp!<cr>", { noremap = true, desc = "Previous buffer" })
map("n", "<leader>bn", "<cmd>bn!<cr>", { noremap = true, desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bd!<cr>", { noremap = true, desc = "Delete buffer" })
map("n", "<leader>bk", "<cmd>bd!<cr>", { noremap = true, desc = "Delete buffer" })
