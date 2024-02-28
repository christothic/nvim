return {
    'nvim-telescope/telescope.nvim', --tag = '0.1.5',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        local telescope = require("telescope")
        telescope.load_extension("workspaces")
        telescope.setup({
            extensions = {
                workspaces = {
                    -- keep_insert = true,
                },
            },
        })
    end
}

