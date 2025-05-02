-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = {
        enabled = false,
      },
      panel = {
        enabled = false,
      },
    },
  },
  {
    'giuxtaposition/blink-cmp-copilot',
    after = { 'copilot.lua' },
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'BufReadPost',
  },
}
