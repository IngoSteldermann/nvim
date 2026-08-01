return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    branch = 'master', -- classic API; the default 'main' branch is the incompatible rewrite
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      -- c, lua, markdown, markdown_inline, query, vim, vimdoc ship as core parsers
      -- with Neovim itself; installing our own copies here shadows them on the
      -- runtimepath with a mismatched build and crashes the treesitter highlighter.
      ensure_installed = { 'bash', 'cpp', 'python', 'foam', 'diff', 'html', 'luadoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      -- auto_install ignores ensure_installed and reinstalls any language it
      -- doesn't own an install-dir copy of the moment its filetype is opened
      -- (see nvim-treesitter's install.lua is_installed()), so the core
      -- parsers above must also be excluded here or they silently come back.
      ignore_install = { "latex", "c", "lua", "markdown", "markdown_inline", "query", "vim", "vimdoc" },
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
        disable = { "latex" },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
}
-- vim: ts=2 sts=2 sw=2 et
