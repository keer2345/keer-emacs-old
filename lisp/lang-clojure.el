;;;;
;; https://www.braveclojure.com/basic-emacs/
;; https://qiita.com/ayato_p/items/8bac8229cf8de93df887
;; https://github.com/bbatsov/prelude/blob/master/modules/prelude-clojure.el

(use-package clojure-mode
             :init
             (add-hook 'clojure-mode-hook #'yas-minor-mode)
             (add-hook 'clojure-mode-hook #'subword-mode)
             :config
             (progn
               (setq clojure-align-forms-automatically t)))

(use-package cider
             :init
             (add-hook 'cider-mode-hook #'clj-refactor-mode)
             (add-hook 'cider-mode-hook #'company-mode)
             (add-hook 'cider-mode-hook #'eldoc-mode)
             (add-hook 'cider-repl-mode-hook #'company-mode)
             (add-hook 'cider-repl-mode-hook #'eldoc-mode)
             :diminish subword-mode
             :config
             (setq nrepl-log-messages t
                   cider-repl-display-in-current-window t
                   cider-repl-use-clojure-font-lock t
                   cider-prompt-save-file-on-load 'always-save
                   cider-font-lock-dynamically '(macro core function var)
                   cider-overlays-use-font-lock t)
             (cider-repl-toggle-pretty-printing))

(use-package clj-refactor
             :diminish clj-refactor-mode
             :config (cljr-add-keybindings-with-prefix "C-c C-m"))

(provide 'lang-clojure)