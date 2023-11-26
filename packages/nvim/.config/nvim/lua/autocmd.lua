local autocmd = vim.api.nvim_create_autocmd

-- 全角スペースを可視化
-- https://zenn.dev/kawarimidoll/articles/450a1c7754bde6
autocmd("VimEnter", {
    pattern = "*",
  callback = function()
    vim.cmd("highlight ExtraWhitespace ctermbg=darkmagenta guibg=darkmagenta")
      vim.fn.matchadd("ExtraWhitespace", "[\\u00A0\\u2000-\\u200B\\u3000]")
    end,
    once = true
  }
)

-- filetype が Markdown の場合、インデントの数を上書きする
-- NOTE: $VIMRUNTIME/ftplugin/markdown.vim の設定値をオーバーライド
autocmd("FileType", {
    pattern = "markdown",
    callback = function()
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
    end
  }
)

autocmd("BufEnter", {
    pattern = "*",
    callback = function()
      if vim.opt.filetype:get() == "markdown" then
        -- _ がハイライトされないようにする
        -- vim.cmd([[syn match markdownError "\\w\\@<=\\w\\@="]])
        vim.cmd([[highlight link markdownError NONE]])
      end
    end
  }
)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<Leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<M-f>', function()
      vim.lsp.buf.format({timeout_ms = 3000})
      vim.cmd("e!")
    end, opts)
  end,
})

