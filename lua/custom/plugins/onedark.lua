---@module 'onedark'
return {
  'navarasu/onedark.nvim',
  priority = 1000,
  enabled = false,
  config = function()
    -- 可选：可用风格 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
    require('onedark').setup {
      style = 'darker',
    }
    require('onedark').load()
  end,
}
