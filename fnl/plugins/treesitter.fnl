;; nvim-treesitter's `main` branch (the old `master` branch is frozen).
;; Requires Neovim 0.12+, the tree-sitter CLI (`brew install tree-sitter-cli`)
;; and a C compiler to build parsers.

(local parsers [:bash
                :clojure
                :commonlisp
                :dockerfile
                :fennel
                :html
                :java
                :javascript
                :json
                :lua
                :markdown
                :markdown_inline
                :yaml])

(fn start-treesitter [ev]
  (let [lang (vim.treesitter.language.get_lang (. vim.bo ev.buf :filetype))]
    ;; only when a parser is installed for this filetype
    (when (and lang (pcall vim.treesitter.start ev.buf lang))
      ;; treesitter indentation, but only for languages that ship indent queries;
      ;; everything else (e.g. clojure, fennel) keeps Neovim's lisp indentation
      (when (vim.treesitter.query.get lang :indents)
        (tset (. vim.bo ev.buf) :indentexpr "v:lua.require'nvim-treesitter'.indentexpr()")))))

[{1 :nvim-treesitter/nvim-treesitter
  :branch :main
  :lazy false
  :build ":TSUpdate"
  :config (fn []
            (let [treesitter (require :nvim-treesitter)]
              (treesitter.install parsers)
              (vim.api.nvim_create_autocmd :FileType
                                           {:group (vim.api.nvim_create_augroup :cajus-treesitter {})
                                            :callback start-treesitter})))}]
