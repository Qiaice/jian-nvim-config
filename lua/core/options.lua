local opt = vim.opt

-- 启用工作目录自动切换
opt.autochdir = false

-- 启用行号和相对行号
opt.number = true
opt.relativenumber = true

-- 配置 1 个 tab 等于 4 个空格
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

-- 配置自动缩进
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.shiftround = true

-- 文本过长时自动换行
opt.wrap = true

-- 配置虚拟文本显示模式(需要插件支持)
opt.virtualedit = 'block'

-- 取消左下角模式显示(使用插件显示)
opt.showmode = false

-- 配置文件编码
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

-- 配置全局 tabline 和 statusline
opt.showtabline = 3
opt.laststatus = 3

-- 启用光标行
opt.cursorline = true

-- 配置光标样式
opt.guicursor:append { 'a:blinkon1' }

-- 启用鼠标
opt.mouse = 'a'

-- 联通系统剪贴板
opt.clipboard = 'unnamedplus'

-- 默认新窗口出现在右/下
opt.splitright = true
opt.splitbelow = true

-- 配置模糊搜索
opt.ignorecase = true
opt.smartcase = true

-- 开启终端真颜色
opt.termguicolors = true

-- 开启侧列
opt.signcolumn = 'yes'

-- 配置自动补全
opt.completeopt = 'menuone,noselect'

-- 设置最大编辑列数提示线(这条线有点粗, 不太好看)
opt.colorcolumn = '90'

-- 启用文件自动读取更改
opt.autoread = true

-- 设置 neovim 窗口标题栏
opt.title = true

-- 与插件响应时间有关, 建议小一点
opt.updatetime = 100

-- 配置允许保存文件编辑信息
opt.undofile = true
opt.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo')

-- 允许 neovim 根据不同的环境使用不同的配置文件
-- 配置文件名: .nvim.lua, .nvimrc, .exrc
opt.exrc = true

-- 禁用 neovim 自带的文件管理器(因为不好用)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 显示不可见字符
opt.list = true
opt.listchars = 'tab:»·,nbsp:+,trail:·,extends:⇐,precedes:⇒'

-- 根据特定文件类型设置空格缩进
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile', 'FileType' }, {
    pattern = { '*.js' }, -- 在此加入需要识别的文件后缀即可
    callback = function () -- 将以下缩进替换为自定义缩进即可, 比如 2
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
    end
})

-- 根据特定文件类型设置自动换行
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = '*.md,*.txt', -- 在此加入需要识别的文件后缀即可
    command = 'setlocal wrap'
})

-- 打开文件时光标重定位到上次编辑的位置
vim.api.nvim_create_autocmd( 'BufReadPost', {
    pattern = '*',
    callback = function ()
        local line = vim.fn.line
        if line('\'"') > 1 and line('\'"') <= line('$') then
            vim.cmd[[normal! g'"]]
        end
    end
})

-- 高亮显示复制的区域
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function ()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
    end
})
