-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.neovide then
    require("config.lazy")
    vim.o.guifont = "Hack Nerd Font Mono"
    vim.g.neovide_fullscreen = false
    vim.g.neovide_cursor_smooth_blink = true
    vim.g.neovide_cursor_vfx_mode = "ripple"
end

