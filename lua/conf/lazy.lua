-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out, 'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require('lazy').setup({
    -- import your plugins
    spec = { { import = 'plugin' } },
    git = {
        -- defaults for the `Lazy log` command
        -- log = { '--since=3 days ago' }, -- show commits from the last 3 days
        log = { '-8' }, -- show the last 8 commits
        timeout = 60, -- kill processes that take more than 1 minutes
        url_format = 'https://github.com/%s.git',
        -- lazy.nvim requires git >=2.19.0. If you really want to use lazy with an older version,
        -- then set the below to false. This should work, but is NOT supported and will
        -- increase downloads a lot.
        filter = true
    },
    -- always use the latest git commit
    default = { version = nil }, 
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    ui = { border = 'rounded' },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { 'tokyonight-night' } },
    -- automatically check for plugin updates
    checker = { enabled = false }
})
