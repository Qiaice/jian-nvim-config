return {

    -- lualine 底部状态栏
    {
        'nvim-lualine/lualine.nvim',
        lazy = true,
        event = 'VeryLazy',
        dependencies = {
            { 'nvim-tree/nvim-web-devicons', lazy = true }
        },
        init = function ()
            vim.g.lualine_laststatus = vim.o.laststatus
            if vim.fn.argc(-1) > 0 then
                -- set an empty statusline till lualine loads
                vim.o.statusline = " "
            else
                -- hide the statusline on the starter page
                vim.o.laststatus = 0
            end
        end,
        opts = {
            options = { theme = 'tokyonight-night' }
        },
        config = function()
            -- 可选值: bubbles, evil_lualine, slanted-gaps
            require('res.style.bubbles')
        end
    },

    -- bufferline 顶部 buffer 页
    {
        'akinsho/bufferline.nvim',
        lazy = true,
        event = 'VeryLazy',
        dependencies = {
            { 'nvim-tree/nvim-web-devicons', lazy = true }
        },
        opts = {
            options = {
                mode = 'buffers',
                numbers = 'ordinal',
                diagnostics = 'nvim_lsp',
                offsets = {
                    {
                        filetype = 'neo-tree',
                        text = 'Neo-tree',
                        highlight = 'Directory',
                        text_align = 'center'
                    }
                }
            }
        },
        config = function(_, opts)
            require('bufferline').setup(opts)
            vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete' }, {
                callback = function()
                    vim.schedule(function()
                        pcall(nvim_bufferline)
                    end)
                end
            })
        end,
        keys = {
            { '<leader>bo', '<cmd>BufferLineCloseOthers<cr>', desc = 'delete other buffers' },
            { '<leader>bl', '<cmd>BufferLineCloseLeft<cr>', desc = 'delete buffers to the left' },
            { '<leader>br', '<cmd>BufferLineCloseRight<cr>', desc = 'delete buffers to the right' },
            { '<leader>bd', '<cmd>bp | bd #<cr>', desc = 'delete buffers' },
            { '<s-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'prev buffer' },
            { '<s-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'next buffer' },
            { '<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>', desc = 'go to buffer 1' },
            { '<leader>2', '<cmd>BufferLineGoToBuffer 2<cr>', desc = 'go to buffer 2' },
            { '<leader>3', '<cmd>BufferLineGoToBuffer 3<cr>', desc = 'go to buffer 3' },
            { '<leader>4', '<cmd>BufferLineGoToBuffer 4<cr>', desc = 'go to buffer 4' },
            { '<leader>5', '<cmd>BufferLineGoToBuffer 5<cr>', desc = 'go to buffer 5' },
            { '<leader>6', '<cmd>BufferLineGoToBuffer 6<cr>', desc = 'go to buffer 6' },
            { '<leader>7', '<cmd>BufferLineGoToBuffer 7<cr>', desc = 'go to buffer 7' },
            { '<leader>8', '<cmd>BufferLineGoToBuffer 8<cr>', desc = 'go to buffer 8' },
            { '<leader>9', '<cmd>BufferLineGoToBuffer 9<cr>', desc = 'go to buffer 9' }
        }
    },

    -- indent-blankline 左侧对齐线
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        lazy = true,
        event = 'VeryLazy',
        opts = {
            indent = { char = '│', tab_char = '│' },
            -- 使用 hlchunk 插件代替高亮缩进线的功能
            scope = { enabled = false, show_start = false, show_end = false },
            exclude = {
                filetypes = {
                    'help',
                    'alpha',
                    'dashboard',
                    'neo-tree',
                    'Trouble',
                    'trouble',
                    'lazy',
                    'mason',
                    'notify',
                    'toggleterm',
                    'lazyterm'
                }
            }
        }
    },

    -- hlchunk 高亮缩进线
    {
        'shellRaining/hlchunk.nvim',
        lazy = true,
        event = 'VeryLazy',
        opts = {
            chunk = { -- 启用代码块高亮
                enable = true,
                use_treesitter = true,
                style = {
                    { fg = '#ee82ee' }, -- 高亮线的颜色
                    { fg = '#ef0000' } -- 错误高亮的颜色
                },
                chars = {
                    horizontal_line = '─',
                    vertical_line = '│',
                    left_top = '╭',
                    left_bottom = '╰',
                    right_arrow = '>'
                },
                error_sign = true,
                max_file_size = 10 * 1024 * 1024,
                duration = 100, -- 动画持续时间
                delay = 100 -- 从移动光标到动画开始的间隔时间
            },
            indent = { enable = false },
            blank = { enable = false },
            -- 高亮当前区块中的行号
            line_num = { enable = true, style = '#5cb3cc' }
        }
    }
}
