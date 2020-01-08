(prelude-require-packages '(lsp-mode lsp-ui lsp-ui company-lsp dap-java))

(use-package lsp-java :ensure t :after lsp
  :config (add-hook 'java-mode-hook 'lsp))

(use-package dap-mode
  :ensure t :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package dap-java
  :after (lsp-java))

(provide 'lang-java-lsp)
