local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- ==============
  -- ENVIRONMENTS
  -- ==============
  --
  -- Block
    s("bck", fmt([[
  :::{{block}} {}
    {}
  :::
    ]], {
      i(1, "Title"),
      i(2, "body"),
    })),

  -- Margin
    s("marg", fmt([[
  :::{{mymargin}} {}
    {}
  :::
    ]], {
      i(1, "Title"),
      i(2, "body"),
    })),

  --
  -- ==============
  -- MATH
  -- ==============
  -- partial derivative with brackets

  -- ==============
  -- FIGURES
  -- ==============
  --
  -- Normal figure
  s("fig", fmt([[
    ::::{{shortcaption}} {}
    :::{{figure}} {}
    :label: fig:{}
    :width: 100%
    {}
    :::
    ::::
    ]], {
      i(1, "Short caption"),
      i(2, "./figures/placeholder.svg"), -- figure path
      i(3, "label"),                     -- label
      i(4, "Figure caption..."),         -- caption text
    })),
  -- Wide figure
  s("figw", fmt([[
    ::::{{shortcaption}} {}
    :::{{figure}} {}
    :label: fig:{}
    :class: full-width
    :width: 100%
    {}
    :::
    ::::
    ]], {
      i(1, "Short caption"),
      i(2, "./figures/placeholder_large.svg"), -- figure path
      i(3, "label"),
      i(4, "Figure caption..."),               -- caption text
    })),
  -- Margin figure
  s("figm", fmt([[
  ::::{{tomargin}}
  :::{{figure}} {}
  :label: fig:{}
  :class: margin
  :width: 100%
  {}
  :::
  ::::
  ]], {
    i(1, "./figures/placeholder_side.svg"), -- figure path
    i(2, "label"),
    i(3, "Figure caption..."),              -- caption
  })),
  -- QR Code
  s("qr", fmt([[
  ::::{{linkedmargin}} {}
  :::{{figure}} {}
  :class: margin
  :width: 60%
  {}
  :::
  ::::
  ]], {
    i(1, "https://google.com"), -- url
    i(2, "./../qrcodes/qr_example.svg"), -- figure path
    i(3, "example code..."),              -- caption
  })),
  -- ==============
  -- TABLES
  -- ==============
  --
  -- Table snippet
    s("tab", fmt([[
    ::::{{shortcaption}} {}
      :::{{list-table}} {}
        :header-rows: {}
        :class: {}
        :label: tab:{}
        * - {}
          - {}
      :::
    ::::
    ]], {
      i(1, "Short caption"),
      i(2, "Table title"),
      i(3, "1"),           -- header-rows
      i(4, "default"),  -- class
      i(5, "example"),     -- label
      i(6, "entry(0,0)"), -- row 0, entry 0
      i(7, "entry(0,1)"), -- row 0, entry 1
    })),
  -- ==============
  -- MISC
  -- ==============
  -- brackets

}

