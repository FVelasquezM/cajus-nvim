(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :nvim-neo-tree/neo-tree.nvim
  :branch "v3.x"
  :dependencies [:nvim-lua/plenary.nvim :nvim-tree/nvim-web-devicons :MunifTanjim/nui.nvim :3rd/image.nvim]
  :config (fn []
            (do 
              (vim.keymap.set "n" "<leader>n" ":Neotree toggle filesystem reveal left<CR>" {})
              (vim.api.nvim_create_autocmd "VimEnter" {:callback (fn []
                                                                   (vim.cmd ":Neotree filesystem reveal left"))})))}]
