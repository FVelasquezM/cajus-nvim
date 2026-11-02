;space is reserved to be lead
(vim.keymap.set :n :<space> :<nop>)

;sets nvim global options
(let [options
      {;tabs is space
       :expandtab true
       ;tab/indent size
       :tabstop 2
       :shiftwidth 2
       :softtabstop 2
       ;completion menu behaviour for nvim-cmp
       :completeopt "menuone,noselect"
       ;case insensitive search
       :ignorecase true
       ;smart search case
       :smartcase true
       ;shared clipboard with the system
       :clipboard "unnamedplus"
       ;show line numbers
       :number true
       ;show line and column number
       :ruler true
       ;makes signcolumn always one column with signs and linenumber
       :signcolumn "number"
       ;border for floating windows (hover, signature help, diagnostics)
       :winborder "single"}]
  (each [option value (pairs options)]
    (tset vim.o option value)))

{}
