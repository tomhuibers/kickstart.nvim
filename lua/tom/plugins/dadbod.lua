return {
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-completion',
  'kristijanhusak/vim-dadbod-ui',
  'tpope/vim-dotenv',
  config = function()
    -- Set a default connection URL for MSSQL
    vim.g['db#url'] = 'sqlserver://sa:Development123@localhost:1433/development'
  end,
}
