local M = {}
M.plugin = {
    {
        "marc0x71/mesone.nvim",
        lazy = false,
        opts = {
            build_folder = "build",
            build_type = "debugoptimized",
            dap_adapter = "gdb",
            show_command_logs = false,
            auto_compile = true,
        },
        dependencies = {
            "j-hui/fidget.nvim",
            "mfussenegger/nvim-dap",
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        init = function()
            print()
        end,
        -- keys = {
        --   { '<leader>mi', '<cmd>Mesone init<cr>',    desc = "Initialize Mesone" },
        --   { '<leader>ms', '<cmd>Mesone setup<cr>',   desc = "Initialize Meson project" },
        --   { '<leader>mc', '<cmd>Mesone compile<cr>', desc = "Compile project" },
        --   { '<leader>mt', '<cmd>Mesone test<cr>',    desc = "Show tests" },
        --   { '<leader>mr', '<cmd>Mesone run<cr>',     desc = "Run target" },
        --   { '<leader>md', '<cmd>Mesone debug<cr>',   desc = "Debug target" },
        --   { '<leader>ml', '<cmd>Mesone log<cr>',     desc = "Show last log" },
        --   { '<leader>mC', '<cmd>Mesone clean<cr>',   desc = "Clean" },
        --   { '<leader>mS', '<cmd>Mesone setting<cr>', desc = "Project settings" },
        -- },
    },
}
return M
