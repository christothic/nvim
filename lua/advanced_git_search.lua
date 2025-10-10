return {
    "aaronhallaert/advanced-git-search.nvim",
    cmd = { "AdvancedGitSearch" },
    config = function()
        -- optional: setup telescope before loading the extension
        require("telescope").setup {
            -- move this to the place where you call the telescope setup function
            extensions = {
                advanced_git_search = {
                    -- {commit_hash} is the placeholder for the commit hash.
                    browse_command = "GBrowse {commit_hash}",
                    -- when {commit_hash} is not provided, the commit will be appended to the specified command seperated by a space
                    -- browse_command = "GBrowse",
                    -- => both will result in calling `:GBrowse commit`

                    -- fugitive or diffview
                    diff_plugin = "fugitive",
                    -- customize git in previewer
                    -- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
                    git_flags = {},
                    -- customize git diff in previewer
                    -- e.g. flags such as { "--raw" }
                    git_diff_flags = {},
                    git_log_flags = {},
                    -- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
                    show_builtin_git_pickers = false,
                    entry_default_author_or_date = "author", -- one of "author", "date" or "both"
                }
            }
        }
        require("telescope").load_extension("advanced_git_search")
    end,
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "tpope/vim-rhubarb",
        "tpope/vim-fugitive",
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {}
    },
}
