local function matcher(ext, commands)
  local current_file = " " .. vim.fn.expand("%:p")
  print(vim.inspect(commands))
  print(vim.inspect(ext))

  if commands[ext] == nil then
    return "terminal"
  end

  local res = commands[ext](current_file)

  return res
end

local function runit(commands)
  if commands == nil then
    commands = "terminal"
  end

  vim.cmd(":vsplit")
  vim.cmd(": " .. matcher(vim.fn.expand("%:e"), commands))
end

local function setup(commands)
  vim.api.nvim_create_user_command("RunIt", function()
    runit(commands)
  end, {})
end

return {
  setup = setup,
}
