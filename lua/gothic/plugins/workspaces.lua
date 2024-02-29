return
{
    "natecraddock/workspaces.nvim",
    version = "*",
    lazy = false,
    config = function()
        require('workspaces').setup({
            hooks = {
                open = {
                    "source .vim",
                    "NvimTreeFindFile",
                    "Telescope find_files"
                },
            },
        })
    end,
    opts = {}
}
