vim.keymap.set('n', '<leader>tt', function()
  if vim.bo.tabstop == 2 then
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
  else
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
  end
  print("tabstop: " .. vim.bo.tabstop)
end, { desc = "Toggle tabstop 2/4" })
