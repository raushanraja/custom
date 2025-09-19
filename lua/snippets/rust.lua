-- Rust Snippets

local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require('luasnip.extras.fmt').fmt

-- Rust snippets
ls.add_snippets('rust', {
  -- Function definition
  s(
    'fn',
    fmt(
      [[
fn {}({}) -> {} {{
    {}
}}
]],
      {
        i(1, 'function_name'),
        i(2, 'param: Type'),
        i(3, 'ReturnType'),
        i(4, '// function body'),
      }
    )
  ),

  -- Main function
  s(
    'main',
    fmt(
      [[
fn main() {{
    {}
}}
]],
      {
        i(1, 'println!("Hello, world!");'),
      }
    )
  ),

  -- Struct definition
  s(
    'struct',
    fmt(
      [[
struct {} {{
    {}
}}
]],
      {
        i(1, 'StructName'),
        i(2, 'field: Type,'),
      }
    )
  ),

  -- Enum definition
  s(
    'enum',
    fmt(
      [[
enum {} {{
    {},
}}
]],
      {
        i(1, 'EnumName'),
        i(2, 'Variant,'),
      }
    )
  ),

  -- Impl block
  s(
    'impl',
    fmt(
      [[
impl {} {{
    fn new() -> Self {{
        Self
    }}
    {}
}}
]],
      {
        i(1, 'StructName'),
        i(2, '// additional methods'),
      }
    )
  ),

  -- Trait definition
  s(
    'trait',
    fmt(
      [[
trait {} {{
    {}
}}
]],
      {
        i(1, 'TraitName'),
        i(2, 'fn method(&self) -> ReturnType;'),
      }
    )
  ),

  -- If statement
  s(
    'if',
    fmt(
      [[
if {} {{
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
if {} {{
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

  -- Match statement
  s(
    'match',
    fmt(
      [[
match {} {{
    {} => {{}},
    _ => {{}},
}}
]],
      {
        i(1, 'expression'),
        i(2, 'pattern'),
      }
    )
  ),

  -- For loop
  s(
    'for',
    fmt(
      [[
for {} in {} {{
    {}
}}
]],
      {
        i(1, 'item'),
        i(2, 'iterable'),
        i(3, '// loop body'),
      }
    )
  ),

  -- While loop
  s(
    'while',
    fmt(
      [[
while {} {{
    {}
}}
]],
      {
        i(1, 'condition'),
        i(2, '// loop body'),
      }
    )
  ),

  -- Loop statement
  s(
    'loop',
    fmt(
      [[
loop {{
    {}
}}
]],
      {
        i(1, '// loop body'),
      }
    )
  ),

  -- Variable declaration
  s(
    'let',
    fmt('let {}: {} = {};', {
      i(1, 'variable'),
      i(2, 'Type'),
      i(3, 'value'),
    })
  ),

  -- Mutable variable
  s(
    'letmut',
    fmt('let mut {}: {} = {};', {
      i(1, 'variable'),
      i(2, 'Type'),
      i(3, 'value'),
    })
  ),

  -- Print macro
  s(
    'print',
    fmt('println!("{}");', {
      i(1, 'message'),
    })
  ),

  -- Format print
  s(
    'fprint',
    fmt('println!("{}: {{}}", {});', {
      i(1, 'label'),
      i(2, 'variable'),
    })
  ),

  -- Vector creation
  s(
    'vec',
    fmt('let mut {}: Vec<{}> = vec![];', {
      i(1, 'vector_name'),
      i(2, 'Type'),
    })
  ),

  -- HashMap creation
  s(
    'hashmap',
    fmt('let mut {}: HashMap<{}, {}> = HashMap::new();', {
      i(1, 'map_name'),
      i(2, 'KeyType'),
      i(3, 'ValueType'),
    })
  ),

  -- Option handling
  s(
    'option',
    fmt(
      [[
match {} {{
    Some(value) => {{}},
    None => {{}},
}}
]],
      {
        i(1, 'option'),
      }
    )
  ),

  -- Result handling
  s(
    'result',
    fmt(
      [[
match {} {{
    Ok(value) => {{}},
    Err(error) => {{}},
}}
]],
      {
        i(1, 'result'),
      }
    )
  ),

  -- Use statement
  s(
    'use',
    fmt('use {};', {
      i(1, 'path::to::item'),
    })
  ),

  -- Module declaration
  s(
    'mod',
    fmt('mod {};', {
      i(1, 'module_name'),
    })
  ),

  -- Test function
  s(
    'test',
    fmt(
      [[
#[test]
fn test_{}() {{
    {}
}}
]],
      {
        i(1, 'test_name'),
        i(2, 'assert!(true);'),
      }
    )
  ),
})
