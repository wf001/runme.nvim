local M = {}
local set_key = vim.api.nvim_create_user_command
local DEFAULT_OPT = require 'runme.const'

local function matched_cmd(ext, commands)
  if commands[ext] == nil then
    return ""
  end

  return commands[ext]
end

local function terminal_stmt()
  return ":terminal "
end

local function do_split(opt)
  local term_pos = opt['position']
  local vertical = opt['vertical']
  local split_cmd = vertical and " vsplit" or " split"
  local do_resize = vertical and "vertical resize" or "resize"
  local size = opt['size']

  vim.cmd(":" .. term_pos .. split_cmd)

  if size ~= nil then
    vim.cmd(":" .. do_resize .. size)
  end
end


local function do_command(commands)
  vim.cmd("autocmd TermOpen * setlocal nonumber")
  vim.cmd("autocmd TermOpen * setlocal norelativenumber")

  vim.cmd(terminal_stmt() .. matched_cmd(vim.fn.expand("%:e"), commands))
  vim.api.nvim_feedkeys("i", "n", false)
end

local function runme(commands, opts)
  do_split(opts)
  do_command(commands)
end

local function merge_conf(conf)
  return vim.tbl_deep_extend('force', DEFAULT_OPT, conf or {})
end

function M.setup(conf)
  set_key(
    "RunMe",
    function()
      local c = merge_conf(conf)
      runme(c.commands, c.opts)
    end,
    {}
  )

  set_key(
    "RunMeVertical",
    function()
      local c = merge_conf(conf)
      c.opts.vertical = true
      runme(c.commands, c.opts)
    end,
    {}
  )
end

return M
