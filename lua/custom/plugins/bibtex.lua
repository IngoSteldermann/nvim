return {
  {
    "nvim-telescope/telescope-bibtex.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      local telescope = require("telescope")

      -- Automatically look for a local .bib file near the current buffer
      local function find_local_bib()
        local cwd = vim.fn.expand("%:p:h") or vim.loop.cwd()
        local matches = vim.fn.globpath(cwd, "*.bib", false, true)
        if #matches > 0 then
          return matches
        else
          -- fallback: if no local .bib found, use global Zotero bib
          return { "~/.zotero/library.bib" }
        end
      end

      telescope.setup({
        extensions = {
          bibtex = {
            global_files = find_local_bib(),   -- use project-local file if present
            citation_format = "[@%s]",         -- or "@%s" for plain latex
            search_keys = { "author", "year", "title" },
            context = true,
          },
        },
      })

      telescope.load_extension("bibtex")
    end,
  },
}

