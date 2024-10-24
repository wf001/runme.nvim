local M = {}

local function matched_cmd(ext, commands)
  print(vim.inspect(commands))
  print(vim.inspect(ext))

  if commands[ext] == nil then
    return ":terminal "
  end

  return commands[ext]
end

local function terminal_stmt(opt)
  return ":terminal "
end

local function runit(commands)
  if commands == nil then
    vim.notify("argument cant be empty", vim.log.levels.WARN)
  end

  vim.cmd("autocmd TermOpen * setlocal nonumber")
  vim.cmd("autocmd TermOpen * setlocal norelativenumber")

  vim.cmd(":split")
  vim.cmd(terminal_stmt({}) .. matched_cmd(vim.fn.expand("%:e"), commands) .. "")
  vim.api.nvim_feedkeys("i", "n", false)
end

local set_key = vim.api.nvim_create_user_command

function M.setup(commands)
  set_key("RunMe", function()
    runit(commands)
  end, {})
end

return M
