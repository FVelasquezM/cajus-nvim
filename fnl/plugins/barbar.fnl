(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :romgrk/barbar.nvim
  :dependencies [:lewis6991/gitsigns.nvim :nvim-tree/nvim-web-devicons]
  :version :^1.0.0
  :config (fn []
            (let [default-opts {:noremap true :silent true}] 
              (vim.api.nvim_set_keymap "n" "<A-,>" "<Cmd>BufferPrevious<CR>" default-opts)
              (vim.api.nvim_set_keymap "n" "<A-.>" "<Cmd>BufferNext<CR>" default-opts)
              (vim.api.nvim_set_keymap "n" "<A-c>" "<Cmd>BufferClose<CR>" default-opts)))}]
