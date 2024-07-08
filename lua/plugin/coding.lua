return {

    -- 括号自动补全
    {
        'echasnovski/mini.pairs',
        lazy = true,
        event = 'InsertEnter',
        opts = {
            modes = { insert = true, command = true, terminal = false },
            -- skip autopair when next character is one of these
            skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
            -- skip autopair when the cursor is inside these treesitter nodes
            skip_ts = { 'string' },
            -- skip autopair when next character is closing pair
            -- and there are more closing pairs than opening pairs
            skip_unbalanced = true,
            -- better deal with markdown code blocks
            markdown = true,
        }
    },

    -- 自动注释
    {
        'echasnovski/mini.comment',
        lazy = true,
        opts = {
            mappings = {
                comment_line = '<leader>cc',
                comment_visual = '<leader>cc',
            }
        },
        keys = {
            { '<leader>cc', '<leader>cc', desc = 'auto comments' }
        }
    }
}
