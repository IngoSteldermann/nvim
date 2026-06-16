-- ~/.config/nvim/lua/user/plugins/vimtex.lua
return {
  "lervag/vimtex",
  lazy = false,  -- ensures it loads immediately
  init = function()
    -- These two are usually set automatically, but we can ensure them anyway:
    vim.cmd("filetype plugin indent on")
    vim.cmd("syntax enable")


    -- Viewer options
    vim.g.vimtex_view_method = "zathura"

    -- Compiler backend (optional)
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
    options = {
      "-pdf",  -- compile to PDF (uses pdflatex)
      "-interaction=nonstopmode",
      "-synctex=1",
    },

}

  end,
}
