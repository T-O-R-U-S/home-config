-- Hey, you! require() does not work here, so you have to manually modify the home-manager
-- config to include the lua scripts that you want to use!
--
-- If there's a better way to do this, please do let me know...

require("nvim-tree").setup()

require'shade'.setup({
  overlay_opacity = 50,
  opacity_step = 1,
  keys = {
    brightness_up    = '<C-Up>',
    brightness_down  = '<C-Down>',
    toggle           = '<Leader>s',
  }
})
