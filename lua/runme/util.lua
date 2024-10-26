local M = {}

function M.debug(arg)
  print(vim.inspect(arg))
end

function M.error(msg)
  vim.notify(msg, vim.log.levels.WARN)
end

return M
