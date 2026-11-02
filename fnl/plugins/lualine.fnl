;latest language server progress message (e.g. clojure-lsp indexing), empty when idle
(var lsp-progress-message "")

(fn lsp-progress []
  lsp-progress-message)

(fn track-lsp-progress [ev]
  (let [value (or (?. ev :data :params :value) {})]
    (set lsp-progress-message
         (if (= value.kind :end)
           ""
           (.. (or value.title "")
               (if value.message (.. " : " value.message) "")
               (if value.percentage (.. " : " value.percentage "%%") "")))))
  (vim.cmd.redrawstatus)
  ;an autocmd callback that returns a truthy value is deleted, so return nil
  nil)

[{1 :nvim-lualine/lualine.nvim
  :config (fn []
            (vim.api.nvim_create_autocmd :LspProgress
                                         {:group (vim.api.nvim_create_augroup :cajus-lualine {})
                                          :callback track-lsp-progress})
            (let [lualine (require :lualine)]
              (lualine.setup
                {:options {:theme :auto
                           :icons_enabled true
                           :section_separators ["" ""]
                           :component_separators ["" ""]}
                 :sections {:lualine_a []
                            :lualine_b [[:mode {:upper true}]]
                            :lualine_c [:branch
                                        {1 :filename
                                         :file_status true
                                         :path 1
                                         :shorting_target 40}]
                            :lualine_x [{1 :diagnostics
                                         :sections [:error :warn :info :hint]
                                         :sources [:nvim_diagnostic]}
                                        lsp-progress
                                        :location
                                        :filetype]
                            :lualine_y [:encoding]
                            :lualine_z []}
                 :inactive_sections {:lualine_a []
                                     :lualine_b []
                                     :lualine_c [{1 :filename
                                                  :file_status true
                                                  :path 1}]
                                     :lualine_x []
                                     :lualine_y []
                                     :lualine_z []}})))}]
