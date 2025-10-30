if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    vim.g.neovide_cursor_animation_length = 0.0
    vim.cmd [[colorscheme slate]]
end


vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true


require("config.lazy")

