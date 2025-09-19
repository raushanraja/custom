local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local fmt = require('luasnip.extras.fmt').fmt

-- Function to get current line number
local function get_line_number()
  return tostring(vim.api.nvim_win_get_cursor(0)[1])
end

-- JavaScript/TypeScript snippets
ls.add_snippets('javascript', {
  -- Function declaration
  s(
    'func',
    fmt(
      [[
function {}({}) {{
  {}
}}
]],
      {
        i(1, 'functionName'),
        i(2, 'params'),
        i(3, '// function body'),
      }
    )
  ),

  -- Arrow function
  s(
    'arrow',
    fmt(
      [[
const {} = ({}) => {{
  {}
}}
]],
      {
        i(1, 'functionName'),
        i(2, 'params'),
        i(3, '// function body'),
      }
    )
  ),

  -- Console log
  s(
    'dlog',
    fmt("console.log('DEBUGLOG::{}::{}', {});", {
      f(get_line_number),
      i(1, 'message'),
      i(2, ''),
    })
  ),

  -- Variable declaration
  s(
    'const',
    fmt('const {} = {};', {
      i(1, 'variable'),
      i(2, 'value'),
    })
  ),

  -- Let declaration
  s(
    'let',
    fmt('let {} = {};', {
      i(1, 'variable'),
      i(2, 'value'),
    })
  ),

  -- If statement
  s(
    'if',
    fmt(
      [[
if ({}) {{
  {}
}}
]],
      {
        i(1, 'condition'),
        i(2, '// if body'),
      }
    )
  ),

  -- If-else statement
  s(
    'ife',
    fmt(
      [[
if ({}) {{
  {}
}} else {{
  {}
}}
]],
      {
        i(1, 'condition'),
        i(2, '// if body'),
        i(3, '// else body'),
      }
    )
  ),

  -- For loop
  s(
    'for',
    fmt(
      [[
for (let {} = {}; {} < {}; {}++) {{
  {}
}}
]],
      {
        i(1, 'i'),
        i(2, '0'),
        i(3, 'i'),
        i(4, 'length'),
        i(5, 'i'),
        i(6, '// loop body'),
      }
    )
  ),

  -- ForEach loop
  s(
    'foreach',
    fmt(
      [[
{}.forEach(({}) => {{
  {}
}});
]],
      {
        i(1, 'array'),
        i(2, 'item'),
        i(3, '// loop body'),
      }
    )
  ),

  -- Map function
  s(
    'map',
    fmt(
      [[
const {} = {}.map(({}) => {{
  {}
}});
]],
      {
        i(1, 'newArray'),
        i(2, 'array'),
        i(3, 'item'),
        i(4, '// return new value'),
      }
    )
  ),

  -- Filter function
  s(
    'filter',
    fmt(
      [[
const {} = {}.filter(({}) => {{
  {}
}});
]],
      {
        i(1, 'filteredArray'),
        i(2, 'array'),
        i(3, 'item'),
        i(4, '// return condition'),
      }
    )
  ),

  -- Try-catch
  s(
    'try',
    fmt(
      [[
try {{
  {}
}} catch (error) {{
  console.error(error);
}}
]],
      {
        i(1, '// try block'),
      }
    )
  ),

  -- Import statement
  s(
    'imp',
    fmt("import {} from '{}';", {
      i(1, '{ module }'),
      i(2, 'module-name'),
    })
  ),

  -- React component
  s(
    'react',
    fmt(
      [[
import React from 'react';

const {} = ({}) => {{
  return (
    <div>
      {}
    </div>
  );
}};

export default {};
]],
      {
        i(1, 'ComponentName'),
        i(2, 'props'),
        i(3, 'Component content'),
        i(4, 'ComponentName'),
      }
    )
  ),
})

-- Add TypeScript specific snippets
ls.add_snippets('typescript', {
  -- TypeScript interface
  s(
    'interface',
    fmt(
      [[
interface {} {{
  {}
}}
]],
      {
        i(1, 'InterfaceName'),
        i(2, 'property: type;'),
      }
    )
  ),

  -- TypeScript type
  s(
    'type',
    fmt(
      [[
type {} = {{
  {}
}};
]],
      {
        i(1, 'TypeName'),
        i(2, 'property: type;'),
      }
    )
  ),

  -- TypeScript function with types
  s(
    'func',
    fmt(
      [[
function {}({}): {} {{
  {}
}}
]],
      {
        i(1, 'functionName'),
        i(2, 'param: type'),
        i(3, 'returnType'),
        i(4, '// function body'),
      }
    )
  ),
})
