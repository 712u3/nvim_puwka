local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")
local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-v>"] = actions.smart_add_to_qflist + actions.open_qflist,
      },
      n = {
        ["<C-v>"] = actions.smart_add_to_qflist + actions.open_qflist,
      }
    }
  },
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    }
  }
}

-- should be after setup
telescope.load_extension("live_grep_args")
