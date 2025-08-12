return {
    'voldikss/fzf-floaterm',
    dependencies = {
        'voldikss/vim-floaterm',
        config = function()
            vim.g.floaterm_autoclose = 2
            vim.g.floaterm_width = 0.8
            vim.g.floaterm_height = 0.8
        end
    },
}
