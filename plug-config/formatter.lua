-- https://github.com/mhartington/formatter.nvim/blob/master/CONFIG.md
require('formatter').setup({
  filetype = {
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
    }
  }
})

-- Format on save
vim.api.nvim_exec([[
  augroup FormatAutogroup
    autocmd BufWritePost *.py,*.sh,*.tf FormatWrite
    autocmd!
  augroup END
]], true)
    -- autocmd BufWritePost * FormatWrite
