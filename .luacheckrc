ignore = {
  "631",    -- max_line_length
}
read_globals = {
  "vim",
  "hl",
  "describe",
  "it",
  "assert"
}
files['tests'] = {
  ignore = {
    '121',        -- Setting a read-only global variable.
    '122',        -- Setting a read-only field of a global variable.
  }
}
