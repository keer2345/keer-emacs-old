(use-package evil
             :init
             (evil-mode 1))

(use-package evil-escape
             :init
             (evil-escape-mode)
             :config
             (setq evil-escape-key-sequence "jk")
             (setq evil-escape-delay 0.4))

(provide 'init-evil)
