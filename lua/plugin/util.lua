return {

    -- persistence 恢复退出前状态
    {
        'folke/persistence.nvim',
        lazy = true,
        event = 'BufReadPre',
        opts = {
            dir = vim.fn.stdpath("state") .. "/sessions/", -- directory where session files are saved
            -- minimum number of file buffers that need to be open to save
            -- Set to 0 to always save
            need = 1,
            branch = true, -- use git branch to save session
        },
        keys = {
            {
                '<leader>qs',
                function ()
                    require('persistence').load()
                end,
                desc = 'restore session'
            },
            {
                '<leader>qS',
                function ()
                    require('persistence').select()
                end,
                desc = 'select a session to load'
            },
            {
                '<leader>ql',
                function ()
                    require('persistence').load({ last = true })
                end,
                desc = 'restore last session'
            },
            {
                '<leader>qd',
                function ()
                    require('persistence').stop()
                end,
                desc = 'don\'t save current session'
            }
        }
    },

    -- flash 光标跳转工具
    {
        'folke/flash.nvim',
        lazy = true,
        opts = {},
        keys = {
            {
                's',
                mode = { 'n', 'x', 'o' },
                function ()
                    require('flash').jump({
                        search = {
                            mode = function (str)
                                return '\\<' .. str
                            end
                        }
                    })
                end,
                desc = 'flash'
            },
            {
                'S',
                mode = { 'n', 'x', 'o' },
                function ()
                    require('flash').treesitter()
                end,
                desc = 'flash treesitter'
            },
            {
                'r',
                mode = 'o',
                function ()
                    require('flash').remote()
                end,
                desc = 'remote flash'
            },
            {
                'R',
                mode = { 'o', 'x' },
                function ()
                    require('flash').treesitter_search()
                end,
                desc = 'treesitter search'
            }
        }
    }
}
