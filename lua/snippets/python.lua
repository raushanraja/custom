-- Python Snippets

local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require('luasnip.extras.fmt').fmt

-- Python snippets
ls.add_snippets('python', {
  -- Function definition
  s(
    'def',
    fmt(
      [[
def {}({}):
    """
    {}
    """
    {}
]],
      {
        i(1, 'function_name'),
        i(2, 'args'),
        i(3, 'Function description'),
        i(4, 'pass'),
      }
    )
  ),

  -- Class definition
  s(
    'class',
    fmt(
      [[
class {}:
    """
    {}
    """
    
    def __init__(self, {}):
        {}
        {}
]],
      {
        i(1, 'ClassName'),
        i(2, 'Class description'),
        i(3, 'args'),
        i(4, 'self.arg = arg'),
        i(5, 'pass'),
      }
    )
  ),

  -- If statement
  s(
    'if',
    fmt(
      [[
if {}:
    {}
]],
      {
        i(1, 'condition'),
        i(2, 'pass'),
      }
    )
  ),

  -- If-else statement
  s(
    'ife',
    fmt(
      [[
if {}:
    {}
else:
    {}
]],
      {
        i(1, 'condition'),
        i(2, 'pass'),
        i(3, 'pass'),
      }
    )
  ),

  -- For loop
  s(
    'for',
    fmt(
      [[
for {} in {}:
    {}
]],
      {
        i(1, 'item'),
        i(2, 'iterable'),
        i(3, 'pass'),
      }
    )
  ),

  -- While loop
  s(
    'while',
    fmt(
      [[
while {}:
    {}
]],
      {
        i(1, 'condition'),
        i(2, 'pass'),
      }
    )
  ),

  -- Try-except
  s(
    'try',
    fmt(
      [[
try:
    {}
except {} as e:
    {}
]],
      {
        i(1, 'pass'),
        i(2, 'Exception'),
        i(3, 'print(f"Error: {e}")'),
      }
    )
  ),

  -- Import statement
  s(
    'imp',
    fmt('import {}', {
      i(1, 'module'),
    })
  ),

  -- From import
  s(
    'from',
    fmt('from {} import {}', {
      i(1, 'module'),
      i(2, 'function'),
    })
  ),

  -- Print statement
  s(
    'print',
    fmt("print('{}')", {
      i(1, 'message'),
    })
  ),

  -- F-string print
  s(
    'fprint',
    fmt("print(f'{}: {{{}}}')", {
      i(1, 'label'),
      i(2, 'variable'),
    })
  ),

  -- List comprehension
  s(
    'listcomp',
    fmt('[{} for {} in {} if {}]', {
      i(1, 'expression'),
      i(2, 'item'),
      i(3, 'iterable'),
      i(4, 'condition'),
    })
  ),

  -- Dictionary comprehension
  s(
    'dictcomp',
    fmt('{{{}: {} for {} in {}}}', {
      i(1, 'key'),
      i(2, 'value'),
      i(3, 'item'),
      i(4, 'iterable'),
    })
  ),

  -- Lambda function
  s(
    'lambda',
    fmt('lambda {}: {}', {
      i(1, 'args'),
      i(2, 'expression'),
    })
  ),

  -- Main guard
  s(
    'main',
    fmt(
      [[
if __name__ == "__main__":
    {}
]],
      {
        i(1, 'main()'),
      }
    )
  ),

  -- With statement
  s(
    'with',
    fmt(
      [[
with {} as {}:
    {}
]],
      {
        i(1, 'context_manager'),
        i(2, 'variable'),
        i(3, 'pass'),
      }
    )
  ),

  -- Assert statement
  s(
    'assert',
    fmt('assert {}, "{}"', {
      i(1, 'condition'),
      i(2, 'Error message'),
    })
  ),

  -- Raise exception
  s(
    'raise',
    fmt('raise {}("{}")', {
      i(1, 'ExceptionType'),
      i(2, 'Error message'),
    })
  ),
})
