local actions = require("telescope.actions")
local open_with_trouble = require("trouble.sources.telescope").open

-- Use this to add more results without clearing the trouble list
local add_to_trouble = require("trouble.sources.telescope").add

local telescope = require("telescope")

telescope.setup({
  defaults = {
    mappings = {
      i = { ["<c-t>"] = open_with_trouble },
      n = { ["<c-t>"] = open_with_trouble },
    },
    hidden = true,
    file_ignore_patterns = { ".git/", "node_modules/", ".cache/", ".env" },
  },
})

local M = {}

M.find_dotfiles = function()
  require("telescope.builtin").find_files({
    prompt_title = " nvim ",
    cwd = "~/.dotfiles/nvim/.config/nvim",
    hidden = true,
  })
end
return M

