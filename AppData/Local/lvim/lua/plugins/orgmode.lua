return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter", lazy = true },
    },
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
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      table.insert(opts.sources, { name = "orgmode" })
    end,
  },
  {
    "mrshmllow/orgmode-babel.nvim",
    dependencies = {
      "nvim-orgmode/orgmode",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = { "OrgExecute", "OrgTangle" },
    opts = {
      langs = { "python", "lua", "shell" },

      -- paths to emacs packages to additionally load
      load_paths = {},
    },
  },
}
