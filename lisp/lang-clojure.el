;;; lang-clojure.el --- Clojure support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;;;
;; https://www.braveclojure.com/basic-emacs/
;; https://qiita.com/ayato_p/items/8bac8229cf8de93df887
;; https://github.com/bbatsov/prelude/blob/master/modules/prelude-clojure.el
;; https://github.com/clojure-emacs/example-config
;; https://github.com/hraberg/deuce
;; https://github.com/mogenslund/liquid

(prelude-require-packages
 '(clojure-mode
   clojure-mode-extra-font-locking
   cider
   clj-refactor
   ;; monroe
   ;; smartparens
   paredit))

(use-package clojure-mode
  :init
  (add-hook 'clojure-mode-hook #'yas-minor-mode)
  (add-hook 'clojure-mode-hook #'subword-mode)
  (add-hook 'clojure-mode-hook #'paredit-mode)
  ;; (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'clojure-mode-hook #'aggressive-indent-mode)
  (add-hook 'clojure-mode-hook #'cider-mode)
  (add-hook 'clojure-mode-hook #'clj-refactor-mode)
  (add-hook 'before-save-hook  #'cider-format-buffer)
  ;; (add-hook 'clojure-mode-hook #'clojure-enable-monroe)
  :config
  (progn
    (setq clojure-align-forms-automatically t)
    (setq clojure-toplevel-inside-comment-form t)))

(use-package cider
  :init
  (add-hook 'cider-mode-hook #'clj-refactor-mode)
  (add-hook 'cider-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'eldoc-mode)
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-repl-mode-hook #'eldoc-mode)
  :diminish subword-mode
  :config
  (setq   cider-repl-use-clojure-font-lock t
	  cider-repl-use-pretty-printing t
	  cider-repl-result-prefix ";; => "
	  cider-repl-wrap-history t
	  cider-show-error-buffer nil)
  )


(use-package cider
  :bind
  (("C-c M-b" . cider-eval-buffer)))

(use-package clj-refactor
  :diminish clj-refactor-mode
  :config (cljr-add-keybindings-with-prefix "C-c C-m"))

(provide 'lang-clojure)
;;; lang-clojure.el ends here
