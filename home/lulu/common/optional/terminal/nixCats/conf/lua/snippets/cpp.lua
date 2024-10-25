ls.add_snippets('cpp', {
  s('std::cout', {
    t 'std::cout << ',
    i(1),
    t ' << std::endl;',
  }),
})

local function format_filename()
  local filename = vim.fn.expand '%:t' -- get current filename with extension
  return filename:upper():gsub('%.', '_') -- convert to uppercase and replace '.' with '_'
end

ls.add_snippets('cpp', {
  s(
    '#ifndef',
    fmt(
      [[
#ifndef {filename}
#define {filename}

{end_guard}
#endif // {filename}
]],
      {
        filename = f(format_filename, {}), -- formatted filename for header guard
        end_guard = i(1),
      }
    )
  ),
})
