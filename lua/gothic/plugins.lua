return {{
    "neovim/nvim-lspconfig",
    version = "*",
    lazy = false,
    config = function()
        local lsp = require('lspconfig')
        lsp.lua_ls.setup {
            on_init = function(client)
                local path = client.workspace_folders[1].name
                if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                    client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                        Lua = {
                            runtime = {
                                -- Tell the language server which version of Lua you're using
                                -- (most likely LuaJIT in the case of Neovim)
                                version = 'LuaJIT'
                            },
                            -- Make the server aware of Neovim runtime files
                            workspace = {
                                checkThirdParty = false,
                                library = {vim.env.VIMRUNTIME -- "${3rd}/luv/library"
                                -- "${3rd}/busted/library",
                                }
                                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                                -- library = vim.api.nvim_get_runtime_file("", true)
                            }
                        }
                    })
                    client.notify("workspace/didChangeConfiguration", {
                        settings = client.config.settings
                    })
                end
                return true
            end
        }
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
            end,
        })
    end,
    opts = {}
}, {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {}
}, {
    "nvim-treesitter/nvim-treesitter",
    version = "*",
    lazy = false,
    config = function()
        local ts = require('nvim-treesitter.configs')
        ts.setup {
            ensure_installed = {"c", "lua", "vim", "vimdoc", "query"},
            highlight = {
                enable = true
            }
        }
    end,
    opts = {}
}, -- { 
--     'jokajak/keyseer.nvim', 
--     version = '*', 
--     opts = {},
-- },
{
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 200
    end,
    opts = {}
}, {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        require("nvim-tree").setup {
            on_attach = function(bufnr)
                local api = require "nvim-tree.api"

                local function opts(desc)
                    return {
                        desc = "nvim-tree: " .. desc,
                        buffer = bufnr,
                        noremap = true,
                        silent = true,
                        nowait = false
                    }
                end

                -- default mappings
                api.config.mappings.default_on_attach(bufnr)
                vim.keymap.del('n', '<tab>', {
                    buffer = bufnr
                })

                -- vim.cmd("NvimTreeClose")
            end,
            -- hijack_unnamed_buffer_when_opening = true,
            -- filters = {
            --     no_buffer = true,
            --   },
            hijack_directories = {
                enable = false,
                auto_open = false
            }
        }
    end,
    opts = {}
}, {
    'romgrk/barbar.nvim',
    dependencies = {'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
    },
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.
    }
    -- version = '^1.0.0', -- optional: only update when a new 1.x version is released
}}
