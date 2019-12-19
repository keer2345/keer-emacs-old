;;; init-common.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Personal information
(setq user-full-name keer-full-name)
(setq user-mail-address keer-mail-address)

;; defalias allows you to rename a command. It is usually used to abbreviate command name.
(defalias 'yes-or-no-p 'y-or-n-p) ; y or n is enough
(defalias 'list-buffers 'ibuffer) ; always use ibuffer

(setq make-backup-files nil)

;; Key Modifiers
(with-no-warnings
  (cond
    (sys/win32p
      ;; make PC keyboard's Win key or other to type Super or Hyper
      ;; (setq w32-pass-lwindow-to-system nil)
      (setq w32-lwindow-modifier 'super     ; Left Windows key
            w32-apps-modifier 'hyper)       ; Menu/App key
      (w32-register-hot-key [s-t]))
    ((and sys/macp (eq window-system 'mac))
     ;; Compatible with Emacs Mac port
     (setq mac-option-modifier 'meta
           mac-command-modifier 'super)
     (bind-keys ([(super a)] . mark-whole-buffer)
                ([(super c)] . kill-ring-save)
                ([(super l)] . goto-line)
                ([(super q)] . save-buffers-kill-emacs)
                ([(super s)] . save-buffer)
                ([(super v)] . yank)
                ([(super w)] . delete-frame)
                ([(super z)] . undo)))))

;; Encoding
;; UTF-8 as the default coding system
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))

;; Explicitly set the prefered coding systems to avoid annoying prompt
;; from emacs (especially on Microsoft Windows)
(prefer-coding-system 'utf-8)

(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)

(setq locale-coding-system 'utf-8
      default-process-coding-system '(utf-8 . utf-8))


(provide 'init-common)

;;; init-common.el ends here
