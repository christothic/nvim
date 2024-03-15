local M = {}

M.plugin = {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            -- local dap = require("dap")
            local _ = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            -- dap.listeners.after.event_initialized["dapui_config"] = function()
            --     dapui.open()
            -- end
            -- dap.listeners.before.event_terminated["dapui_config"] = function()
            --     dapui.close()
            -- end
            -- dap.listeners.before.event_exited["dapui_config"] = function()
            --     dapui.close()
            -- end
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            {
                "williamboman/mason.nvim",
            },
            {
                "mfussenegger/nvim-dap",
                -- config = function(_, _) require("core.utils").load_mappings("dap") end,
            },
        },
        opts = {
            handlers = {},
            -- ensure_installed = { "codelldb" },
        },
    },
}

return M

-- local M = {}

-- M.dap = {
--   plugin = true,
--   n = {
--     ["<leader>db"] = {
--       "<cmd> DapToggleBreakpoint <CR>",
--       "Add breakpoint at line",
--     },
--     ["<leader>dr"] = {
--       "<cmd> DapContinue <CR>",
--       "Start or continue the debugger",
--     }
--   }
-- }

-- return M
