;diagnostics display, including the symbols shown in the sign column
(vim.diagnostic.config
  {:severity_sort true
   :update_in_insert true
   :underline true
   :virtual_text false
   :float {:border "single"}
   :signs {:text {vim.diagnostic.severity.ERROR ""
                  vim.diagnostic.severity.WARN ""
                  vim.diagnostic.severity.INFO ""
                  vim.diagnostic.severity.HINT ""}}})

(fn on-attach [ev]
  (let [map (fn [mode lhs rhs desc]
              (vim.keymap.set mode lhs rhs {:buffer ev.buf : desc}))
        telescope #(require :telescope.builtin)]
    (map :n :gd vim.lsp.buf.definition "Go to definition")
    (map :n :K vim.lsp.buf.hover "Hover documentation")
    (map :n :<leader>ld vim.lsp.buf.declaration "Go to declaration")
    (map :n :<leader>lt vim.lsp.buf.type_definition "Go to type definition")
    (map :n :<leader>lh vim.lsp.buf.signature_help "Signature help")
    (map :n :<leader>ln vim.lsp.buf.rename "Rename")
    (map :n :<leader>le vim.diagnostic.open_float "Line diagnostics")
    (map :n :<leader>lq vim.diagnostic.setloclist "Diagnostics to loclist")
    (map :n :<leader>lf vim.lsp.buf.format "Format buffer")
    (map :n :<leader>lj #(vim.diagnostic.jump {:count 1 :float true}) "Next diagnostic")
    (map :n :<leader>lk #(vim.diagnostic.jump {:count -1 :float true}) "Previous diagnostic")
    ;code_action handles visual ranges itself
    (map [:n :x] :<leader>la vim.lsp.buf.code_action "Code action")
    ;telescope
    (map :n :<leader>lw #((. (telescope) :diagnostics)) "Workspace diagnostics")
    (map :n :<leader>lr #((. (telescope) :lsp_references)) "References")
    (map :n :<leader>li #((. (telescope) :lsp_implementations)) "Implementations")))

[{1 :neovim/nvim-lspconfig
  :dependencies [:hrsh7th/cmp-nvim-lsp]
  :config (fn []
            (let [cmplsp (require :cmp_nvim_lsp)]
              ;; defaults shared by every language server
              (vim.lsp.config "*" {:capabilities (cmplsp.default_capabilities)})
              (vim.api.nvim_create_autocmd :LspAttach
                                           {:group (vim.api.nvim_create_augroup :cajus-lsp {})
                                            :callback on-attach})
              ;; To add support for more language servers, add their names here.
              ;; Available configs: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
              ;; Per-server settings go in (vim.lsp.config :<name> {...}) before this line.
              (vim.lsp.enable [:clojure_lsp])))}]
