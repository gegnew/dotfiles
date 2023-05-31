local M = {}

function M.setup()
  require("neotest").setup({
    quickfix = {
      open = false,
    },
    adapters = {
      require("neotest-python")({
        -- dap = { justMyCode = false },
        args = { "--log-level", "DEBUG" },
        runner = "pytest",
      }),
    },
    output_panel = {
      enabled = true,
      open = "botright split | resize 15"
    },
  })
end

return M
