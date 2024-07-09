return {

    -- neovim 文档树
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        lazy = true,
        dependencies = {
            { 'nvim-lua/plenary.nvim', lazy = true },
            { 'nvim-tree/nvim-web-devicons', lazy = true },
            { 'MunifTanjim/nui.nvim', lazy = true }
            -- { '3rd/image.nvim', lazy = true }, -- 可选, 添加图像预览支持
        },
        cmd = 'Neotree',
        opts = {
            close_if_last_window = true,
            use_default_mappings = false, -- 不使用默认映射
            sources = { 'filesystem', 'buffers', 'git_status' },
            open_files_do_not_replace_types = {
                'terminal',
                'Trouble',
                'trouble',
                'qf',
                'Outline'
            },
            filesystem = {
                bind_to_cwd = false,
                follow_current_file = { enabled = true },
                use_libuv_file_watcher = true,
            },
            window = {
                mappings = {
                    ['<esc>'] = 'cancel', -- close preview or floating neo-tree window
                    ['<cr>'] = 'open',
                    ['o'] = 'open',
                    ['P'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = true } },
                    -- show_path: 'none', 'relative', 'absolute'
                    ['a'] = { 'add', config = { show_path = 'none' } },
                    ['A'] = 'add_directory',
                    ['d'] = 'delete',
                    ['r'] = 'rename',
                    ['y'] = 'copy_to_clipboard',
                    ['x'] = 'cut_to_clipboard',
                    ['p'] = 'paste_from_clipboard',
                    ['c'] = 'copy', -- takes text input for destination, also accepts the optional config.show_path option like 'add' 
                    ['m'] = 'move', -- takes text input for destination, also accepts the optional config.show_path option like 'add'
                    -- ['q'] = 'close_window',
                    ['q'] = 'cancel',
                    ['R'] = 'refresh',
                    ['?'] = 'show_help',
                    ['<'] = 'prev_source',
                    ['>'] = 'next_source',
                }
            }
        },
        keys = {
            {
                '<leader>e',
                function ()
                    require('neo-tree.command').execute({
                        toggle = true,
                        reveal_force_cwd = true,
                        dir = vim.fn.getcwd()
                    })
                end,
                desc = 'explorer neoTree (cwd)',
            },
            {
                '<leader>ge',
                function ()
                    require('neo-tree.command').execute({
                        source = 'git_status',
                        toggle = true,
                        reveal_force_cwd = true,
                        dir = vim.fn.getcwd()
                    })
                end,
                desc = 'explorer neoTree (git)',
            },
            {
                '<leader>be',
                function ()
                    require('neo-tree.command').execute({
                        source = 'buffers',
                        toggle = true,
                        reveal_force_cwd = true,
                        dir = vim.fn.getcwd()
                    })
                end,
                desc = 'explorer neoTree (buffers)',
            },
        },
        deactivate = function ()
            vim.cmd([[Neotree close]])
        end
    },

    -- which-key 查看绑定快捷键
    {
        'folke/which-key.nvim',
        lazy = true,
        event = 'VeryLazy',
        opts = {
            plugins = { spelling = true },
            defaults = {
                mode = { 'n', 'v' },
                ['<leader>b'] = { name = 'buffer explorer' },
                ['<leader>c'] = { name = 'auto comment' },
                ['<leader>g'] = { name = 'git explorer' },
                ['<leader>s'] = { name = 'split windows' },
                ['<leader>f'] = { name = 'finder' },
                ['<leader>r'] = { name = 'return telescope' },
                ['<leader>q'] = { name = 'load session' },
                ['<leader>n'] = { name = 'unhighlight' }
            }
        },
        config = function (_, opts)
            local wk = require('which-key')
            wk.setup(opts)
            wk.register(opts.defaults)
        end
    },

    -- telescope 搜索器
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        lazy = true,
        dependencies = {
            { 'nvim-lua/plenary.nvim', lazy = true },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                lazy = true,
                build = 'make'
            },
            { 'BurntSushi/ripgrep', lazy = true },
            { 'sharkdp/fd', lazy = true },
        },
        cmd = 'Telescope',
        opts = {
            extensions = {
                fzf = {
                    fuzzy = true,                    -- false will only do exact matching
                    override_generic_sorter = true,  -- override the generic sorter
                    override_file_sorter = true,     -- override the file sorter
                    case_mode = 'smart_case',        -- or "ignore_case" or "respect_case", default: 'smart_case'
                }
            }
        },
        config = function (_, opts)
            -- You dont need to set any of these options. These are the default ones. Only
            -- the loading is important
            require('telescope').setup(opts)
            -- To get fzf loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require('telescope').load_extension('fzf')
        end,
        keys = {
            {
                '<leader>ff',
                function ()
                    require('telescope.builtin').find_files()
                end,
                desc = 'find files'
            },
            {
                '<leader>fg',
                function ()
                    require('telescope.builtin').live_grep()
                end,
                desc = 'find grep in all files'
            },
            {
                '<leader><space>',
                function ()
                    require('telescope.builtin').buffers()
                end,
                desc = 'find buffers'
            },
            {
                '<leader>fh',
                function ()
                    require('telescope.builtin').help_tags()
                end,
                desc = 'find help tags'
            },
            {
                '<leader>?',
                function ()
                    require('telescope.builtin').oldfiles()
                end,
                desc = 'find opened files'
            },
            {
                '<leader>/',
                function ()
                    require('telescope.builtin').current_buffer_fuzzy_find()
                end,
                desc = 'find grep in current buffer'
            },
            {
                '<leader>rs',
                function ()
                    require('telescope.builtin').resume()
                end,
                desc = 'return old telescope windows'
            }
        }
    }
}
