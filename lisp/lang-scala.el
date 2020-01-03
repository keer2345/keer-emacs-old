;; Enable scala-mode and sbt-mode
(use-package scala-mode
  :mode "\\.s\\(cala\\|bt\\)$")

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(use-package eglot
  :pin melpa
  :config
  (add-to-list 'eglot-server-programs '(scala-mode . ("metals-emacs")))
  ;; (optional) Automatically start metals for Scala files.
  :hook (scala-mode . eglot-ensure))

(provide 'lang-scala)


