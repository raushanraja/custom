-- Lua Snippets

local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

-- Lua snippets
ls.add_snippets('lua', {
  -- Function snippet
  s(
    'func',
    fmt(
      [[
local function {}({})
  {}
end
]],
      {
        i(1, 'function_name'),
        i(2, 'args'),
        i(3, '-- function body'),
      }
    )
  ),

  -- Local variable snippet
  s(
    'local',
    fmt('local {} = {}', {
      i(1, 'variable'),
      i(2, 'value'),
    })
  ),

  -- If statement snippet
  s(
    'if',
    fmt(
      [[
if {} then
  {}
end
]],
      {
        i(1, 'condition'),
        i(2, '-- body'),
      }
    )
  ),

  -- For loop snippet
  s(
    'for',
    fmt(
      [[
for {} = {}, {} do
  {}
end
]],
      {
        i(1, 'i'),
        i(2, '1'),
        i(3, '10'),
        i(4, '-- loop body'),
      }
    )
  ),

  -- For each loop snippet
  s(
    'foreach',
    fmt(
      [[
for {}, {} in pairs({}) do
  {}
end
]],
      {
        i(1, 'key'),
        i(2, 'value'),
        i(3, 'table'),
        i(4, '-- loop body'),
      }
    )
  ),

  -- Require snippet
  s(
    'req',
    fmt("local {} = require('{}')", {
      i(1, 'module'),
      i(2, 'module_name'),
    })
  ),

  -- Print snippet
  s(
    'print',
    fmt("print('{}')", {
      i(1, 'message'),
    })
  ),

  -- Table snippet
  s(
    'table',
    fmt(
      [[
local {} = {{
  {}
}}
]],
      {
        i(1, 'table_name'),
        i(2, 'key = value'),
      }
    )
  ),
})

