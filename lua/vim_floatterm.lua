return {
    'voldikss/fzf-floaterm',
    dependencies = {
        'voldikss/vim-floaterm',
        config = function()
            vim.g.floaterm_autoclose = 2
        end
    },
}
