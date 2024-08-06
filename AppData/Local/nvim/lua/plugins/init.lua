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

	{
		"hkupty/iron.nvim",
		-- lazy = false,
    event = "VeryLazy",
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
							command = { "python3" },
						},
					},
					-- How the repl window will be displayed
					-- See below for more information
					repl_open_cmd = require("iron.view").split("33%"),
				},
				-- Iron doesn't set keymaps by default anymore.
				-- You can set them here or manually add keymaps to the functions in iron.core
				keymaps = {
					send_motion = "<leader>rr",
					visual_send = "<leader>rr",
					send_file = "<leader>rf",
					send_line = "<leader>rl",
					send_mark = "<leader>rmm",
					mark_motion = "<leader>rmc",
					mark_visual = "<leader>rmc",
					remove_mark = "<leader>rmd",
					cr = "<leader>r<cr>",
					interrupt = "<leader>r<space>",
					exit = "<leader>rq",
					clear = "<leader>rc",
				},
				-- If the highlight is on, you can change how it looks
				-- For the available options, check nvim_set_hl
				highlight = {
					italic = true,
				},
				ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
			})
			vim.keymap.set("n", "<leader>ris", "<cmd>IronRepl<cr>")
			vim.keymap.set("n", "<leader>rir", "<cmd>IronRestart<cr>")
		end,
	},
	{
		"David-Kunz/gen.nvim",
		-- lazy = false,
    event = "VeryLazy",
		opts = {
			model = "deepseek-coder-v2", -- The default model to use.
			host = "localhost", -- The host running the Ollama service.
			port = "11434", -- The port on which the Ollama service is listening.
			display_mode = "float", -- The display mode. Can be "float" or "split".
			show_prompt = false, -- Shows the Prompt submitted to Ollama.
			show_model = false, -- Displays which model you are using at the beginning of your chat session.
			quit_map = "q", -- set keymap for quit
			no_auto_close = false, -- Never closes the window automatically.
			init = function(options)
				pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
			end,
			-- Function to initialize Ollama
			command = function(options)
				return "curl --silent --no-buffer -X POST http://"
					.. options.host
					.. ":"
					.. options.port
					.. "/api/chat -d $body"
			end,
			-- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
			-- This can also be a command string.
			-- The executed command must return a JSON object with { response, context }
			-- (context property is optional).
			-- list_models = '<omitted lua function>', -- Retrieves a list of model names
			debug = false, -- Prints errors and the command which is run.
		},
	},
	{
		"kdheepak/lazygit.nvim",
		-- lazy = false,
    event = "VeryLazy",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	},

  {
    "NeogitOrg/neogit",
		lazy = true,
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = true
  },

	{
		"nvim-orgmode/orgmode",
		lazy = true,
    event = "VeryLazy",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter", lazy = true },
		},
		event = "VeryLazy",
		config = function()
			-- Setup treesitter
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { "org" },
				},
				ensure_installed = { "org" },
			})
			-- Setup orgmode
			require("orgmode").setup({
				org_agenda_files = "~/org/*/*.org",
				org_default_notes_file = "~/org/pages/refile.org",
				org_hide_leading_stars = true,
				org_blank_before_new_entry = { heading = false, plain_list_item = false },
				org_startup_indented = false,
				org_edit_src_content_indentation = 2,
				win_split_mode = "auto",
				org_highlight_latex_and_related = "entities",
				org_agenda_span = "day",
				org_agenda_start_on_weekday = false,
				org_todo_keywords = { "TODO", "DOING", "|", "DONE", "CANCELED" },
				-- org_startup_folded = "showeverything",
			})
		end,
	},
}
