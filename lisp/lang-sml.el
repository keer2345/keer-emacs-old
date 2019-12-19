;;; Emacs for Programming Languages course on Coursera
;;; https://tuhdo.github.io/emacs-for-proglang.html

;;; Code:

(use-package sml-mode)

(use-package geiser
  :config
  (setq geiser-default-implementation "racket"))

(provide 'lang-sml)

;;; lang-sml.el ends here
