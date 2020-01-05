;;; Emacs for Programming Languages course on Coursera
;;; https://tuhdo.github.io/emacs-for-proglang.html

;;; Code:

;;; sml
;; (use-package sml-mode)
;; 
;; (use-package geiser
;;   :config
;;   (setq geiser-default-implementation "racket"))


(use-package paredit
  :init
  (paredit-mode t)
  :config
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode))


(provide 'lang-lisp)

;;; lang-sml.el ends here
