-- ~/.config/nvim/lua/user/plugins/vimtex.lua
return {
  "lervag/vimtex",
  lazy = false,  -- ensures it loads immediately
  init = function()
    -- These two are usually set automatically, but we can ensure them anyway:
    vim.cmd("filetype plugin indent on")
    vim.cmd("syntax enable")


    -- Viewer options
    -- "zathura_simple" avoids xdotool window-ID tracking, which doesn't work
    -- under native Wayland (was causing "cannot find Zathura window ID").
    vim.g.vimtex_view_method = "zathura_simple"

    -- Disable VimTeX's own auto-open-on-first-compile: it races with the
    -- VimtexEventCompileSuccess hook below (both fire on the first compile),
    -- which was launching two separate Zathura windows. The hook alone
    -- covers opening + forward-searching on every compile, first included.
    vim.g.vimtex_view_automatic = 0

    -- Compiler backend (optional)
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
    options = {
      "-pdf",  -- compile to PDF (uses pdflatex)
      "-interaction=nonstopmode",
      "-synctex=1",
      "-shell-escape",  -- needed e.g. for \includesvg (svg package -> inkscape)
    },

}

    -- After every successful (auto-)compile, forward-search the PDF to the
    -- current cursor line, so saving jumps the viewer to where you're editing.
    vim.api.nvim_create_autocmd("User", {
      pattern = "VimtexEventCompileSuccess",
      group = vim.api.nvim_create_augroup("vimtex_auto_forward_search", { clear = true }),
      callback = function()
        vim.cmd("VimtexView")
      end,
    })

  end,
}
