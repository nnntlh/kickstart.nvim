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

      -- Makefile indentation
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'make',
        group = group,
        callback = function()
          vim.bo.expandtab = false
          vim.bo.tabstop = 4
          vim.bo.shiftwidth = 4
          vim.bo.softtabstop = 0
        end,
      })
    end,
  },
}
