return {
  get_python_path = function()
    local path = vim.fn.exepath "python3"
    if path == "" then
      error "Python3 interpreter not found in PATH!"
    end
    return path
  end,
}
