(use-package try)

(use-package lorem-ipsum
             :init
             (lorem-ipsum-use-default-bindings))

;; Automatically reload files was modified by external program
(use-package autorevert
             :ensure nil
             :diminish
             :hook (after-init . global-auto-revert-mode))

;; Hungry deletion
(use-package hungry-delete
             :ensure nil
             :diminish
             :hook (after-init . global-hungry-delete-mode)
             :config (setq-default hungry-delete-chars-to-skip " \t\f\v"))

;; dashboard
;; (use-package dashboard
;;              :config
;;              (dashboard-setup-startup-hook))

(use-package which-key
             :diminish which-key-mode
             :config
             (which-key-setup-side-window-right-bottom)
             :bind (:map help-map ("C-h" . which-key-C-h-dispatch))
             :hook (after-init . which-key-mode))

(provide 'init-util)

;;; init.el ends here
