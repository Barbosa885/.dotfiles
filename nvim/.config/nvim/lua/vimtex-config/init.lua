-- Vimtex configuration

vim.g.tex_flavor = 'latex'
vim.g.vimtex_compiler_progname = 'nvr'
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_view_general_viewer = 'zathura'
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_fold_enabled = 1
vim.g.vimtex_fold_manual = 1
vim.g.vimtex_fold_level = 99
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = {
 options = {
   '-verbose',
   '-file-line-error',
   '-synctex=1',
   '-interaction=nonstopmode',
   '-shell-escape',
 },
}
vim.g.vimtex_compiler_latexmk_engines = {
 _ = '-pdf',
 pdflatex = '-pdf',
 lualatex = '-lualatex',
 xelatex = '-xelatex',
}
