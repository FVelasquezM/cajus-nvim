;nvim-paredit supports fennel natively since 1.0, so nvim-paredit-fennel is no longer needed
[{1 :julienvincent/nvim-paredit
  :lazy true
  :ft [:clojure :fennel]
  :config (fn []
            (let [paredit (require :nvim-paredit)]
                (paredit.setup {:keys {"<localleader>k" [paredit.api.delete_form "Delete a form"]}})))}

 {1 :kylechui/nvim-surround
  :event "VeryLazy"
  :config (fn []
            (let [surround (require :nvim-surround)]
              (surround.setup)))}

 {1 :windwp/nvim-autopairs
  :event "InsertEnter"
  :config (fn []
            (let [autopairs (require :nvim-autopairs)
                  lisps [:clojure :fennel]]
              (autopairs.setup {})
              ;' and ` are reader macros in lisps, not string delimiters,
              ;so don't auto-insert a closing one there
              (each [_ quote-char (ipairs ["'" "`"])]
                (each [_ rule (ipairs (autopairs.get_rules quote-char))]
                  (set rule.not_filetypes (vim.list_extend (or rule.not_filetypes []) lisps))))
              ;re-apply the rules to the buffer that triggered loading
              (autopairs.force_attach)))}]
