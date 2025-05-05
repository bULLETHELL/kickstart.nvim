return {
  'winter-again/wezterm-config.nvim',
  config = function()
    require('wezterm-config').setup {
      -- looks in wezterm/lua/*
      append_wezterm_to_rtp = true,
    }

    local nvim_profile = require 'nvim_profile'
    local wezterm_config = require 'wezterm-config'
    vim.api.nvim_create_autocmd('VimEnter', {
      pattern = '*',
      callback = function()
        wezterm_config.set_wezterm_user_var('colors', nvim_profile.colors.in_nvim)
        wezterm_config.set_wezterm_user_var('window_background_opacity', nvim_profile.window_background_opacity.in_nvim)
      end,
      group = vim.api.nvim_create_augroup('wezterm_config_vim_enter', { clear = true }),
      once = true,
    })
    vim.api.nvim_create_autocmd('VimLeave', {
      pattern = '*',
      callback = function()
        wezterm_config.set_wezterm_user_var('colors', nvim_profile.colors.outside_nvim)
        wezterm_config.set_wezterm_user_var('window_background_opacity', nvim_profile.window_background_opacity.outside_nvim)
      end,
      group = vim.api.nvim_create_augroup('wezterm_config_vim_leave', { clear = true }),
      once = true,
    })
  end,
}
