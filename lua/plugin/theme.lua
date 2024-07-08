return {

    -- tokyonight 主题
    {
        'folke/tokyonight.nvim',
        lazy = true,
        event = 'VeryLazy',
        opts = { style = 'night' },
        config = function ()
            vim.cmd([[colorscheme tokyonight-night]]) -- 启用主题
            vim.api.nvim_set_hl(0, 'CursorLineNr', { fg='#5cb3cc' }) -- 设置行号颜色
            vim.cmd([[hi ColorColumn guibg=#292e42]]) -- 设置编辑线颜色
        end
    }
}
