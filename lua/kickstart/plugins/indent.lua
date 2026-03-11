return {
  {
    'nvim-lua/plenary.nvim',
    lazy = false,
    config = function()
      local group = vim.api.nvim_create_augroup('UserIndentSettings', { clear = true })

      local function set_indent(width, use_spaces)
        vim.bo.tabstop = width
        vim.bo.shiftwidth = width
        vim.bo.softtabstop = width
        vim.bo.expandtab = use_spaces
      end

      vim.api.nvim_create_autocmd('FileType', {
        group = group,
        pattern = { 'cpp', 'c', 'yaml' },
        callback = function() set_indent(2, true) end,
      })

      vim.api.nvim_create_autocmd('FileType', {
        group = group,
        pattern = { 'bash', 'python', 'java', 'html', 'javascript', 'vim', 'sh', 'dot' },
        callback = function() set_indent(4, true) end,
      })

      vim.api.nvim_create_autocmd('FileType', {
        group = group,
        pattern = 'go',
        callback = function() set_indent(4, false) end,
      })
    end,
  },
}
