local M = {}

function M.git_branch()
  local branch = vim.fn.system "git branch --show-current 2>/dev/null | tr -d '\n'"
  return branch ~= '' and ' ' .. branch or ''
end

function M.gitsigns_status()
  local dict = vim.b.gitsigns_status_dict
  if not dict then
    return ''
  end

  local added = dict.added or 0
  local changed = dict.changed or 0
  local removed = dict.removed or 0

  local parts = {}

  if added > 0 then
    table.insert(parts, '%#GitSignsAdd#+ ' .. added .. '%*')
  end
  if changed > 0 then
    table.insert(parts, '%#GitSignsChange#~ ' .. changed .. '%*')
  end
  if removed > 0 then
    table.insert(parts, '%#GitSignsDelete#- ' .. removed .. '%*')
  end

  if #parts == 0 then
    return ''
  end

  return table.concat(parts, ' ')
end

function M.file_state()
  -- define (or refresh) highlights locally
  vim.api.nvim_set_hl(0, 'SLModified', {
    fg = '#FFD700',
    bold = true,
  })

  vim.api.nvim_set_hl(0, 'SLReadonly', {
    fg = '#960e19',
    bold = true,
  })

  if vim.bo.readonly then
    return '%#SLReadonly#%*'
  end

  if vim.bo.modified then
    return '%#SLModified#●%*'
  end

  return ''
end

function M.lsp_diagnostics()
  local bufnr = vim.api.nvim_get_current_buf()

  local errors = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.WARN })
  local hints = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.HINT })
  local info = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.INFO })

  local parts = {}

  if errors > 0 then
    table.insert(parts, '%#DiagnosticError# ' .. errors .. '%*')
  end
  if warnings > 0 then
    table.insert(parts, '%#DiagnosticWarn# ' .. warnings .. '%*')
  end
  if info > 0 then
    table.insert(parts, '%#DiagnosticInfo# ' .. info .. '%*')
  end
  if hints > 0 then
    table.insert(parts, '%#DiagnosticHint# ' .. hints .. '%*')
  end

  -- If nothing to show, display green icon
  if #parts == 0 then
    return '%#DiagnosticOk#%*'
  end

  return table.concat(parts, ' ')
end

local statusline = {
  ' ',
  '%{%v:lua.require("statusline").git_branch()%}', -- Git Branch
  ' ',
  '%{%v:lua.require("statusline").gitsigns_status()%}', -- Git Status
  '%=', -- Separator
  '%{%v:lua.require("statusline").file_state()%}', -- Modified/RO Status
  ' ',
  ' ',
  '%F', -- Absolute File name
  '  ',
  '%{%v:lua.require("statusline").lsp_diagnostics()%}', -- LSP Diagnostics
  '  ',
  '󰘡 %L', -- Total no. of lines
  '  ',
  ' %3l:%-2c ', -- Cursor Position
  ' ',
}

vim.o.statusline = table.concat(statusline, '')

return M

