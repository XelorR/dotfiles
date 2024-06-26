return {
  -- Took from:
  -- https://github.com/dpetka2001/dotfiles/blob/main/dot_config/nvim/lua/plugins/extras/lang/python.lua
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "black",
        -- "ruff",
        -- "pyright",
      })
    end,
  },

  -- Setup adapters as nvim-dap dependencies
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      -- stylua: ignore
      keys = {
        { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method" },
        { "<leader>dPc", function() require('dap-python').test_class() end,  desc = "Debug Class" },
      },
      config = function()
        local path = require("mason-registry").get_package("debugpy"):get_install_path()
        require("dap-python").setup(path .. "/venv/bin/python")
      end,
    },
  },

  -- Add which-key namespace for Python debugging
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>dP"] = { name = "+Python" },
      },
    },
  },

  -- Setup `neotest`
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          -- Here you can specify the settings for the adapter, i.e.
          runner = "pytest",
          -- python = ".venv/bin/python",
        },
      },
    },
  },

  --  -- Add `server` and setup lspconfig
  --  {
  --    "neovim/nvim-lspconfig",
  --    dependencies = {},
  --    opts = {
  --      servers = {
  --        -- pyright = {},
  --        pylsp = {
  --          mason = false,
  --          settings = {
  --            pylsp = {
  --              plugins = {
  --                rope_autoimport = {
  --                  enabled = true,
  --                },
  --              },
  --            },
  --          },
  --        },
  --        ruff_lsp = {
  --          -- handlers = {
  --          --   ["textDocument/publishDiagnostics"] = function() end,
  --          -- },
  --        },
  --        -- jedi_language_server = {},
  --      },
  --      setup = {
  --        ruff_lsp = function()
  --          require("lazyvim.util").lsp.on_attach(function(client, _)
  --            if client.name == "ruff_lsp" then
  --              -- Disable hover in favor of Pyright
  --              client.server_capabilities.hoverProvider = false
  --            end
  --          end)
  --        end,
  --        pyright = function()
  --          require("lazyvim.util").lsp.on_attach(function(client, _)
  --            if client.name == "pyright" then
  --              -- disable hover in favor of jedi-language-server
  --              client.server_capabilities.hoverProvider = false
  --            end
  --          end)
  --        end,
  --      },
  --    },
  --  },

  -- Setup up format with new `conform.nvim`
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["python"] = { { "black" } } --, "ruff" } },
      },
    },
  },

  -- For selecting virtual envs
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "mfussenegger/nvim-dap-python",
    },
    cmd = "VenvSelect",
    opts = {
      dap_enabled = true,
    },
    keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },
}
