local set = vim.keymap.set

set('i', 'jj', '<Esc>')
set('n', ';', ':')
set('n', 'tt', ':tabnew<CR>')
set('n', 'tl', ':tabnext<CR>')
set('n', 'th', ':tabprevious<CR>')
set('n', '<Esc><Esc>', ':nohlsearch<CR>')
set('n', ',p', '"_dP')
set({'n', 'x', 'o'}, 'e', '<Plug>(leap-forward-to)')
set({'n', 'x', 'o'}, 'E', '<Plug>(leap-backward-to)')
set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
set('n', 'gf', '<cmd>lua vim.lsp.buf.format()<CR>')
set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
set('n', '<Leader>e', vim.diagnostic.open_float)
set('n', '[d', vim.diagnostic.goto_prev)
set('n', ']d', vim.diagnostic.goto_next)
set('n', '<Leader>q', vim.diagnostic.setloclist)
set({'i', 's'}, '<C-l>', '<Plug>(vsnip-jump-next)')
set({'i', 's'}, '<C-h>', '<Plug>(vsnip-jump-prev)')