[{1 :Olical/conjure
  :branch "master"
  :ft [:clojure :fennel]
  :init (fn []
          ;a plain string gets Conjure's <localleader> prefix, so docs are on ,K
          ;and K stays free for LSP hover (see lsp.fnl)
          (set vim.g.conjure#mapping#doc_word "K")
          (set vim.g.conjure#client#clojure#nrepl#eval#auto_require false)
          (set vim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)
          (set vim.g.conjure#client#clojure#nrepl#test#current_form_names ["deftest" "defflow" "defflow-new-system!" "defflow-mx" "defspec"]))}]
