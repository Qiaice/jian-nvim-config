-- 貌似能提升一些加载速度
vim.loader.enable()

-- 加载核心配置
require('core.options')
require('core.keymaps')

-- 加载前端 GUI 和插件管理器
require('conf.neovide') -- 可选
require('conf.lazy')
