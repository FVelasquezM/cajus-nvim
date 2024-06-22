(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :github/copilot.vim
  :config (fn []
            (do 
              (vim.keymap.set "i" "<C-J>" "copilot#Accept('\\<CR>')" {:expr true :replace_keycodes false})
              (set vim.g.copilot_no_tab_map true)))}]
