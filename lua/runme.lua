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

local function runit(commands, opt)
  if commands == nil then
    vim.notify("argument cant be empty", vim.log.levels.WARN)
  end

  vim.cmd("autocmd TermOpen * setlocal nonumber")
  vim.cmd("autocmd TermOpen * setlocal norelativenumber")

  local pos = opt['position'] or 'belowright'
  local dir = opt['direction'] and " vsplit" or " split"
  local resize_dir = dir == "vsplit" and "vertical " or ""

  vim.cmd(":" .. pos .. dir)

  if opt["size"] ~= nil then
    vim.cmd(":" .. resize_dir .. "resize " .. opt["size"])
  end
  vim.cmd(terminal_stmt(opt) .. matched_cmd(vim.fn.expand("%:e"), commands) .. "")
  vim.api.nvim_feedkeys("i", "n", false)
end

local set_key = vim.api.nvim_create_user_command

function M.setup(commands, opt)
  set_key("RunMe", function()
    runit(commands, opt or {})
  end, {})
  set_key("RunMeVertical", function()
    opt.direction = true
    runit(commands, opt or {})
  end, {})
end

return M
