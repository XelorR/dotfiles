require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local del = vim.keymap.del

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- insert mode
map("i", "jj", "<Esc>", { silent = true })
map("t", "jj", "<C-\\><C-n>", { silent = true })
map("t", "<Esc>", "<C-\\><C-n>", { silent = true })

-- files
map("n", "<leader><space>", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<leader>fs", "<cmd>w<cr>", { noremap = true, desc = "save buffer" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>cd", "<cmd>cd %:p:h<cr>", { noremap = true, desc = "cd to this file" })
map("n", "<leader>qq", "<cmd>qa<cr>", { noremap = true, desc = "quit" })

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
map("n", "<C-left>", "<cmd>vert res -5<cr>" )
map("n", "<C-right>", "<cmd>vert res +5<cr>" )
map("n", "<C-down>", "<cmd>res -5<cr>" )
map("n", "<C-up>", "<cmd>res +5<cr>" )

-- run command
map("i", "<M-x>", "<Esc>:")
map("n", "<M-x>", ":")

-- overridings
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
del("n", "<leader>b")
