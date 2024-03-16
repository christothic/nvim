local M = {}

M.plugin = { -- Autoformat
    "stevearc/conform.nvim",
    opts = {
        notify_on_error = true,
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
        formatters_by_ft = {
            lua = { "stylua" },
            -- h = { "asp-grep" },
            -- cpp = { "asp-grep" },
            -- h = { "clang-format" },
            -- cpp = { "clang-format" },
            -- Conform can also run multiple formatters sequentially
            -- python = { "isort", "black" },
            --
            -- You can use a sub-list to tell conform to run *until* a formatter
            -- is found.
            -- javascript = { { "prettierd", "prettier" } },
        },
    },
}

-- M.plugin = {
--     "mhartington/formatter.nvim",
--     lazy = false,
--     config = function()
--         local util = require("formatter.util")
--
--         -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
--         require("formatter").setup({
--             -- Enable or disable logging
--             logging = true,
--             -- Set the log level
--             log_level = vim.log.levels.WARN,
--             -- All formatter configurations are opt-in
--             filetype = {
--                 -- cpp = {
--                 -- require("formatter.filetypes.cpp").clangd,
--                 -- },
--                 -- Formatter configurations for filetype "lua" go here
--                 -- and will be executed in order
--                 lua = {
--                     -- "formatter.filetypes.lua" defines default configurations for the
--                     -- "lua" filetype
--                     require("formatter.filetypes.lua").stylua,
--
--                     -- You can also define your own configuration
--                     function()
--                         -- Supports conditional formatting
--                         -- if util.get_current_buffer_file_name() == "special.lua" then
--                         -- return nil
--                         -- end
--
--                         -- Full specification of configurations is down below and in Vim help
--                         -- files
--                         return {
--                             exe = "stylua",
--                             args = {
--                                 "--search-parent-directories",
--                                 "--stdin-filepath",
--                                 util.escape_path(util.get_current_buffer_file_path()),
--                                 "--",
--                                 "-",
--                             },
--                             stdin = true,
--                         }
--                     end,
--
--                     -- Use the special "*" filetype for defining formatter configurations on
--                     -- 	-- any filetype
--                     -- ["*"] = {
--                     -- "formatter.filetypes.any" defines default configurations for any
--                     -- filetype
--                     -- require("formatter.filetypes.any").remove_trailing_whitespace,
--                     -- },
--                 },
--             },
--         })
--     end,
-- }

return M
