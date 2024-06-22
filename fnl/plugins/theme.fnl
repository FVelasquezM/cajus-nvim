(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :catppuccin/nvim
  :name :catppuccin
  :priority 1000
  :config (fn [] 
            (let [catppuccin (require :catppuccin)]
              (catppuccin.setup {:flavour :mocha})
              (vim.cmd "colorscheme catppuccin")))}]


