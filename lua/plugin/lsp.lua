return {

    -- lsp-config 配置
    {
        'neovim/nvim-lspconfig',
        lazy = true,
        config = true
    },

    -- mason lsp 服务下载管理器
    {
        'williamboman/mason.nvim',
        lazy = true,
        dependencies = {
            {
                'williamboman/mason-lspconfig.nvim',
                lazy = true
            }
        },
        build = ':MasonUpdate',
        cmd = 'Mason',
        opts = {
            ui = {
                border = 'rounded',
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗'
                }
            }
        },
        keys = {
            { '<leader>m', '<cmd>Mason<cr>', desc = 'open Mason console' }
        }
    }
}
