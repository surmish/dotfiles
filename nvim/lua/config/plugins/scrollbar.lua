local M = {
  "petertriho/nvim-scrollbar",
  event = "BufReadPost",
}

function M.config()
  local scrollbar = require("scrollbar")

  -- PERF: throttle scrollbar refresh
  -- Disable, throttle, since it was caused by comment TS
  -- local render = scrollbar.render
  -- scrollbar.render = require("util").throttle(300, render)
  
end

return M
