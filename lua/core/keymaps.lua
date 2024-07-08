-- 设置主键
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap
local opt = { 
    noremap = true, -- 禁止递归映射
    silent = true -- 禁用映射输出
}

-- 禁用上下左右键
map.set({'n', 'i', 'v'}, '<up>', '<nop>', opt)
map.set({'n', 'i', 'v'}, '<down>', '<nop>', opt)
map.set({'n', 'i', 'v'}, '<left>', '<nop>', opt)
map.set({'n', 'i', 'v'}, '<right>', '<nop>', opt)

-- 配置一行内上下移动
map.set('n', 'j', [[v:count ? 'j' : 'gj']], {
    noremap = true,
    silent = true,
    expr = true
})
map.set('n', 'k', [[v:count ? 'k' : 'gk']], {
    noremap = true,
    silent = true,
    expr = true
})

-- 取消 s 键的默认功能
map.set('n', 's', '<nop>', opt)

-- 配置插入模式快捷回退到普通模式
map.set('i', 'jk', '<esc>', opt)

-- 配置视觉模式下单行或多行移动
map.set('v', 'J', ':m \'>+1<cr>gv=gv', opt)
map.set('v', 'K', ':m \'<-2<cr>gv=gv', opt)
map.set('v', '<', '<gv', opt)
map.set('v', '>', '>gv', opt)

-- 在多个窗口间快捷跳转
map.set('n', '<c-h>', '<c-w>h', opt)
map.set('n', '<c-j>', '<c-w>j', opt)
map.set('n', '<c-k>', '<c-w>k', opt)
map.set('n', '<c-l>', '<c-w>l', opt)

-- 快捷水平/垂直新增窗口
map.set('n', '<leader>sv', '<c-w>v', {
    noremap = true,
    silent = true,
    desc = 'split windows to right'
})
map.set('n', '<leader>sh', '<c-w>s', {
    noremap = true,
    silent = true,
    desc = 'split windows to bottom'
})

-- 快捷取消高亮
map.set('n', '<leader>nh', '<cmd>nohlsearch<cr>', {
    noremap = true,
    silent = true,
    desc = 'unhighlight'
})

-- 快捷打开 Lazy 控制台
map.set('n', '<leader>l', '<cmd>Lazy<cr>', {
    noremap = true,
    silent = true,
    desc = 'open Lazy console'
})
