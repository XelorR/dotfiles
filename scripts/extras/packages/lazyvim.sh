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

rm -rf ~/.config/lazyvim ~/.local/share/lazyvim
mkdir -p ~/.config/lazyvim ~/.local/bin

cat <<'EOF' >~/.local/bin/lazyvim
#!/usr/bin/env bash

( NVIM_APPNAME=lazyvim nvim $@ )
EOF
chmod +x ~/.local/bin/lazyvim

(
  NVIM_APPNAME=lazyvim

  git clone https://github.com/LazyVim/starter ~/.config/lazyvim
  rm -rf ~/.config/lazyvim/.git

  mkdir -p ~/.config/lazyvim/lua/plugins
  cat <<'EOF' >~/.config/lazyvim/lua/plugins/nvim-notify.lua
return {
    "rcarriga/nvim-notify",
    opts = {
        level = 5,
        render = "compact",
        stages = "static",
    },
}

EOF
  cat <<'EOF' >~/.config/lazyvim/lua/config/keymaps.lua
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del

-- Return to normal mode
map("i", "jj", "<Esc>", { silent = true })
-- map("t", "jj", "<C-\\><C-n>", { silent = true })
map("t", "<Esc>", "<C-\\><C-n>", { silent = true })

-- Files and windows
map("n", "<leader>fs", "<cmd>w<cr>", { noremap = true, desc = "Save buffer" })
map("n", "<leader>cd", "<cmd>cd %:p:h<cr>", { noremap = true, desc = "cd to this file" })
map("n", "<leader><tab>", "<cmd>b#<cr>", { noremap = true, desc = "Previously active buffer" })
map("n", "<leader>bb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>wd", "<C-w>q", { desc = "Close window" })
map("n", "<leader>wo", "<C-w>o", { desc = "Close other windows" })
map("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>ws", "<C-w>s", { desc = "Split window horisontally" })

-- Yank file name
map("n", "<leader>fy", '<cmd>let @" = expand("%:t")<cr>', { noremap = true, desc = "Yank file name" })

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
EOF

  cat <<'EOF' >~/.config/lazyvim/lua/plugins/iron.lua
return {
  {
    "hkupty/iron.nvim",
    config = function()
      local iron = require("iron.core")
  
      iron.setup({
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          -- Your repl definitions come here
          repl_definition = {
            sh = {
              -- Can be a table or a function that
              -- returns a table (see below)
              command = { "zsh" },
            },
            python = {
              command = { "python3" }
            },
          },
          -- How the repl window will be displayed
          -- See below for more information
          repl_open_cmd = require("iron.view").split("33%"),
        },
        -- Iron doesn't set keymaps by default anymore.
        -- You can set them here or manually add keymaps to the functions in iron.core
        keymaps = {
          send_motion = "<space>rr",
          visual_send = "<space>rr",
          send_file = "<space>rf",
          send_line = "<space>rl",
          send_mark = "<space>rmm",
          mark_motion = "<space>rmc",
          mark_visual = "<space>rmc",
          remove_mark = "<space>rmd",
          cr = "<space>r<cr>",
          interrupt = "<space>r<space>",
          exit = "<space>rq",
          clear = "<space>rc",
        },
        -- If the highlight is on, you can change how it looks
        -- For the available options, check nvim_set_hl
        highlight = {
          italic = true,
        },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      })
  
      -- iron also has a list of commands, see :h iron-commands for all available commands
      vim.keymap.set("n", "<space>ris", "<cmd>IronRepl<cr>")
      vim.keymap.set("n", "<space>rir", "<cmd>IronRestart<cr>")
      vim.keymap.set("n", "<space>rif", "<cmd>IronFocus<cr>")
      vim.keymap.set("n", "<space>rih", "<cmd>IronHide<cr>")
    end,
  },
}
EOF
)
