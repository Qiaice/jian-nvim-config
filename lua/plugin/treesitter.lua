return {

    -- tree-sitter 语法解析器
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    event = 'VeryLazy',
    build = ':TSUpdate',
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall', 'TSInstallInfo' },
    opts = {
        ensure_installed = { 
            'c', 'java', 'python', 'json', 'lua', 'vimdoc'
        },
        sync_install = true,
        auto_install = true,
        highlight = {
            enable = true,
            disable = {},
            -- 取消重复高亮
            additional_vim_regex_highlighting = false
        },
        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<cr>',
                node_incremental = '<cr>',
                scope_incremental = '<tab>',
                node_decremental = '<bs>'
            }
        }
    },
    config = function (_, opts)
        -- switch the default install method to curl
        require('nvim-treesitter.install').prefer_git = false
        -- 设置使用的编译器
        require('nvim-treesitter.install').compilers = { 'cc', 'gcc', 'clang' }
        require('nvim-treesitter.configs').setup(opts)
    end,
    keys = {
        {
            '<leader>fm',
            function ()
                local pos = { vim.fn.line('.'), vim.fn.col('.') } -- 保存当前光标位置
                vim.cmd([[normal! gg0=G]]) -- 格式化代码
                -- 拼接待执行命令
                local command = string.format('%dj%dlw', pos[1] - 1, pos[2] - 1)
                vim.cmd([[normal! ]] .. command) -- 将光标恢复原位
            end,
            desc = 'format file'
        }
    }
}
