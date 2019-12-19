;;; init-common.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


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


(provide 'init-edit)
;;; init-common.el ends here
