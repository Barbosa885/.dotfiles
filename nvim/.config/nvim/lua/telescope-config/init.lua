local M = {}

M.find_dotfiles = function()
  require("telescope.builtin").find_files({
    prompt_title = " nvim ",
    cwd = "~/.dotfiles/nvim/.config/nvim",
    hidden = true,
  })
end
return M
