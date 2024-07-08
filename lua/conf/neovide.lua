local map = vim.keymap
local opt = { 
    noremap = true, -- 禁止递归映射
    silent = true -- 禁用映射输出
}

if vim.g.neovide then

    -- 字体及字号
    vim.o.guifont = 'CodeNewRoman Nerd Font Mono:h12'

    -- 窗口模糊
    vim.g.neovide_window_blurred = true

    -- 透明度
    vim.g.neovide_transparency = 1.0

    -- 键入时隐藏鼠标
    vim.g.neovide_hide_mouse_when_typing = true

    -- 全屏模式
    vim.g.neovide_fullscreen = false

    -- 记住上一次窗口大小
    vim.g.neovide_remember_window_size = true

    -- 抗锯齿
    vim.g.neovide_cursor_antialiasing = true

    -- 粒子特效
    vim.g.neovide_cursor_vfx_mode = "ripple"

    -- 使用 ctrl + c/v 联通系统剪贴板进行复制粘贴
    map.set('v', '<c-c>', '"+y', opt)
    map.set('v', '<c-x>', '"+d"', opt)
    map.set('i', '<c-v>', '<esc>"+pa', opt)
end
