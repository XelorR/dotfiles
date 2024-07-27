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

rm -rf ~/.opt/lazyvim
mkdir -p ~/.opt/lazyvim ~/.local/bin

cat <<'EOF' >~/.local/bin/lazyvim
#!/usr/bin/env bash

( HOME=$HOME/.opt/lazyvim; nvim $@ )
EOF
chmod +x ~/.local/bin/lazyvim

(
  HOME=$HOME/.opt/lazyvim

  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git

  mkdir -p ~/.config/nvim/lua/plugins
  cat <<'EOF' >~/.config/nvim/lua/plugins/nvim-notify.lua
return {
    "rcarriga/nvim-notify",
    opts = {
        level = 5,
        render = "compact",
        stages = "static",
    },
}
EOF
  cat <<'EOF' >~/.config/nvim/lua/config/keymaps.lua
-- Return to normal mode
vim.keymap.set("i", "jj", "<Esc>", { silent = true })
vim.keymap.set("t", "jj", "<C-\\><C-n>", { silent = true })

-- Files and windows
vim.keymap.set("n", "<leader>fs", "<cmd>w<cr>", { noremap = true, desc = "Save buffer" })
vim.keymap.set("n", "<leader>cd", "<cmd>cd %:p:h<cr>", { noremap = true, desc = "cd to this file" })
vim.keymap.set("n", "<leader>wo", "<C-w>o", { noremap = true, desc = "Delete other windows" })

--- Run command
vim.keymap.set("i", "<M-x>", "<Esc>:")
vim.keymap.set("n", "<M-x>", ":")
EOF

  cat <<'EOF' >~/.config/nvim/lua/plugins/iron.lua
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
