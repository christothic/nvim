return {
    'voldikss/fzf-floaterm',
    dependencies = {
        'voldikss/vim-floaterm',
        config = function()
            vim.g.floaterm_autoclose = 2
            vim.g.floaterm_width = 0.9
            vim.g.floaterm_height = 0.9
        end
    },
}
