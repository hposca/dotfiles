-- https://github.com/mhartington/formatter.nvim/blob/master/CONFIG.md
-- Interesting list of formatters: https://github.com/sbdchd/neoformat#supported-filetypes
require('formatter').setup({
  filetype = {
    javascript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
          stdin = true
        }
      end
    },
    json = {
       function()
         return {
           exe = "jq",
           stdin = true,
         }
       end,
    },
    python = {
        -- pip3 install --user black
       function()
         return {
           exe = "black",
           args = { "-" },
           stdin = true,
         }
       end,
    },
    sh = {
       -- Shell Script Formatter
       -- https://github.com/mvdan/sh#shfmt
       function()
         return {
           exe = "shfmt",
           args = { "-i", 2 },
           stdin = true,
         }
       end,
    },
    terraform = {
      function()
        return {
          exe = "terraform",
          args = { "fmt", "-" },
          stdin = true
        }
      end
    },
    yaml = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
          stdin = true
        }
      end
    },
  }
})

-- Format on save
vim.api.nvim_exec([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.json,*.py,*.sh,*.tf,*.yaml,*.yml FormatWrite
  augroup END
]], true)
    -- autocmd BufWritePost * FormatWrite
