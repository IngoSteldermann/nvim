local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- ==============
  -- ENVIRONMENTS
  -- ==============
  -- itemize
  s("lst", fmt([[
    \begin{{itemize}}
      \item {}
    \end{{itemize}}
    ]], { i(1, "First item") })),
  -- list
  s("enum", fmt([[
    \begin{{enumerate}}
      \item {}
    \end{{enumerate}}
    ]], { i(1, "First item") })),
  --
  --
  -- ==============
  -- MATH
  -- ==============
  -- partial derivative with brackets
  s("pdb", fmt("\\partial_{{{}}} \\left( {} \\right)", { i(1, "x"), i(2, "body") })),

  -- ==============
  -- FIGURES
  -- ==============
  s({ trig = "fig", dscr = "Insert LaTeX figure environment" },
    fmt([[
      \begin{{figure}}[!htb]
          \centering
          \includegraphics[width=0.8\textwidth]{{{}}}
          \caption{{{}}}
          \label{{fig:{}}}
      \end{{figure}}
    ]],
    {
      i(1, "figures/placeholder.pdf"),        -- file path
      i(2, "Caption text"),         -- caption
      i(3, "label"),                -- label
    })
  ),
  --
  -- ==============
  -- TABLES
  -- ==============
  --
  -- ==============
  -- MISC
  -- ==============
  -- brackets
  s("b(", fmt("\\left( {} \\right)", { i(1, "body") })),
  s("b[", fmt("\\left[ {} \\right]", { i(1, "body") })),
  s("it", fmt("\\textit{{{}}}", { i(1, "body") })),
  s("bo", fmt("\\textbf{{{}}}", { i(1, "body") })),
  s("todo", fmt("\\todo[inline]{{{}}}", { i(1, "body") })),

  -- ==============
  -- SME CUSTOM
  -- ==============

}

