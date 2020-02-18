;; try
(use-package try)


(use-package lorem-ipsum
  :init
  (lorem-ipsum-use-default-bindings))

;; Automatically reload files was modified by external program
(use-package autorevert
  :ensure nil
  :diminish
  :hook (after-init . global-auto-revert-mode))


;; dashboard
;; (use-package dashboard
;;              :config
;;              (dashboard-setup-startup-hook))

(use-package which-key
  :diminish which-key-mode
  :config
  (progn
    (which-key-setup-side-window-right-bottom)
    (setq which-key-idle-secondary-delay 0.05))
  ;; :bind (:map help-map ("C-h" . which-key-C-h-dispatch))
  :hook (after-init . which-key-mode))

;; Writable grep buffer and apply the changes to files
(use-package wgrep
  :init
  (setq wgrep-auto-save-buffer t
    wgrep-change-readonly-file t))

(use-package smartparens)
(use-package keyfreq
             :init
             (keyfreq-mode 1)
             (keyfreq-autosave-mode 1))


(use-package recentf
  :ensure nil
  :hook (after-init . recentf-mode)
  :init (setq recentf-max-saved-items 300
              recentf-exclude
              '("\\.?cache" ".cask" "url" "COMMIT_EDITMSG\\'" "bookmarks"
                "\\.\\(?:gz\\|gif\\|svg\\|png\\|jpe?g\\|bmp\\|xpm\\)$"
                "\\.?ido\\.last$" "\\.revive$" "/G?TAGS$" "/.elfeed/"
                "^/tmp/" "^/var/folders/.+$" ; "^/ssh:"
                (lambda (file) (file-in-directory-p file package-user-dir))))
  :config (push (expand-file-name recentf-save-file) recentf-exclude))

(provide 'init-util)

;;; init.el ends here
