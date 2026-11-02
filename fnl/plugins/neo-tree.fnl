[{1 :nvim-neo-tree/neo-tree.nvim
  :branch "v3.x"
  :dependencies [:nvim-lua/plenary.nvim :nvim-tree/nvim-web-devicons :MunifTanjim/nui.nvim]
  :config (fn []
            (do 
              (vim.keymap.set "n" "<leader>n" ":Neotree toggle filesystem reveal left<CR>" {})
              ;open the tree on startup only when nvim is launched without files
              ;(so it stays out of the way for `nvim file` and git commit messages)
              (vim.api.nvim_create_autocmd "VimEnter" {:callback (fn []
                                                                   (when (= (vim.fn.argc) 0)
                                                                     (vim.cmd ":Neotree filesystem reveal left")))})))}]
