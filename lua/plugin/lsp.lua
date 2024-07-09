return {

    -- mason lsp 服务器下载管理器
    {
        'williamboman/mason.nvim',
        lazy = true,
        build = ':MasonUpdate',
        cmd = 'Mason',
        opts = {}
    }
}
