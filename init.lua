-- lazyインストール
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- テーマ設定
require('lazy').setup({
  -- カラースキーム
  {
    'yasukotelin/shirotelin',
    config = function()
      vim.cmd[[colorscheme shirotelin]]
    end
  },

  -- easymotion
  {
    'easymotion/vim-easymotion',
    event = 'VeryLazy',
    config = function()
      local opt = {
        EasyMotion_smartcase = 1,
        EasyMotion_space_jump_first = 1,
        EasyMotion_do_mapping = 0,
        mapleader = ' '
      }
      for k, v in pairs(opt) do
        vim.g[k] = v
      end
      local map = {
        {'n', 'f', '<Plug>(easymotion-fl)'},
        {'n', 'F', '<Plug>(easymotion-Fl)'},
        {'n', 't', '<Plug>(easymotion-tl)'},
        {'n', 'T', '<Plug>(easymotion-Tl)'},
        {'n', '<leader>j', '<Plug>(easymotion-j)'},
        {'n', '<leader>k', '<Plug>(easymotion-k)'},
        {'n', '<leader><leader>', '<Plug>(easymotion-s2)'},
        {'n', ';', '<Plug>(easymotion-next)'},
        {'n', ',', '<Plug>(easymotion-prev)'},
      }
      for _, m in ipairs(map) do
        local mode, org, dest = m[1], m[2], m[3]
        vim.keymap.set(mode, org, dest)
      end
    end
  },

  -- Fernブラウザ
  {
    'lambdalisue/fern.vim',
    event = 'VeryLazy',
    keys = {
      { '<C-n>', ':Fern ~/ -reveal=% -drawer -toggle -width=40<CR>', desc = 'toggle fern' }
    }
  },

  -- Sorround
  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    config = function()
      local function ptn(l, r)
        return { { l }, { r } }
      end
      require('nvim-surround').setup({
        surrounds = {
          -- 空白有無を入れ替え
          ['('] = { add = function() return ptn('(', ')') end },
          ['{'] = { add = function() return ptn('{', '}') end },
          ['['] = { add = function() return ptn('[', ']') end },
          ['<'] = { add = function() return ptn('<', '>') end },
          [')'] = { add = function() return ptn('( ', ' )') end },
          ['}'] = { add = function() return ptn('{ ', ' }') end },
          [']'] = { add = function() return ptn('[ ', ' ]') end },
          ['>'] = { add = function() return ptn('< ', ' >') end },
        },
      })
    end
  },
})

-- 設定定義
local function g_option()
  local opt = {
    mouse = 'a',
    clipboard = {'unnamed', 'unnamedplus'},
    fileencodings = 'ucs-bombs, utf-8, euc-jp, cp932',
    hidden = true,
    number = true,
    ignorecase = true,
    smartcase = true,
    wrapscan = true,
    relativenumber = true,
    statusline = '%F',
    ambiwidth = 'double',
    tabstop = 2,
    expandtab = true,
    shiftwidth = 2,
    smartindent = true,
  }
  for k, v in pairs(opt) do
    vim.opt[k] = v
  end
end
g_option()

-- キー定義
local function k_remap()
  local map = {
    {'n', 'Y', 'yy'},
    {'n', 'j', 'gj'},
    {'n', 'k', 'gk'},
    {'c', 's/', 's/\\v'},
    {'i', '{', '{}<LEFT>'},
    {'i', '[', '[]<LEFT>'},
    {'i', '(', '()<LEFT>'},
    {'n', '<ESC><ESC>', ':noh<CR><ESC>'},
  }
  for _, m in ipairs(map) do
    local mode, org, dest = m[1], m[2], m[3]
    vim.keymap.set(mode, org, dest)
  end
end
k_remap()

-- leader設定
vim.g.mapleader = ' '
local function l_remap()
  local map = {
    {'n', '<leader>a', 'ggVG'},
    {'n', '<leader>s', ':save ~/Desktop/.md<left><left><left>'},
    {'n', '<leader>*', ':%s/\\v<C-r><C-w>//g<left><left>'},
  }
  for _, m in ipairs(map) do
    local mode, org, dest = m[1], m[2], m[3]
    vim.keymap.set(mode, org, dest)
  end
end
l_remap()

-- 関数設定
vim.api.nvim_create_user_command(
  'Init',
  function() 
    vim.cmd[[:tabe ~/.config/nvim/init.lua]]
  end,
  {}
)
