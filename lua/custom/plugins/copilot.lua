---@module 'copilot'
return {
  'github/copilot.vim',
  -- event = 'InsertEnter',
  config = function()
    -- 可选：默认禁用 Tab 接受（避免和补全插件冲突）
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true

    -- 用 Ctrl+J 接受 Copilot 建议
    vim.keymap.set('i', '<C-j>', 'copilot#Accept("<CR>")', {
      expr = true,
      replace_keycodes = false,
      silent = true,
      desc = 'Copilot Accept',
    })
    -- 可选：打开/关闭快捷键
    vim.keymap.set('n', '<leader>ce', ':Copilot enable<CR>', { desc = 'Copilot Enable' })
    vim.keymap.set('n', '<leader>cd', ':Copilot disable<CR>', { desc = 'Copilot Disable' })
    vim.keymap.set('n', '<leader>cs', ':Copilot status<CR>', { desc = 'Copilot Status' })
  end,
}
