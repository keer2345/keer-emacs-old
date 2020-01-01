;;; init-common.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Personal information
(setq user-full-name keer-full-name)
(setq user-mail-address keer-mail-address)

;; defalias allows you to rename a command. It is usually used to abbreviate command name.
(fset 'yes-or-no-p 'y-or-n-p) ; y or n is enough
(fset 'list-buffers 'ibuffer) ; always use ibuffer

(setq debug-on-error t
      backup-inhibited t
      make-backup-files nil
      auto-save-default nil
      auto-save-list-file-prefix nil
      load-prefer-newer t
      ring-bell-function 'ignore
      sentence-end-double-space nil)

;; Fonts
(when (display-graphic-p)
  ;; Set default font
  (cl-loop for font in '("Hack" "Fira Code" "SF Mono" "Source Code Pro"
                         "Menlo" "Monaco" "DejaVu Sans Mono" "Consolas")
           when (font-installed-p font)
           return (set-face-attribute 'default nil
                                      :font font
                                      :height (cond (sys/mac-x-p 130)
                                                    (sys/win32p 110)
                                                    (t 100))))

  ;; Specify font for all unicode characters
  (cl-loop for font in '("Symbola" "Apple Symbols" "Symbol" "icons-in-terminal")
           when (font-installed-p font)
           return (set-fontset-font t 'unicode font nil 'prepend))

  ;; Specify font for Chinese characters
  (cl-loop for font in '("WenQuanYi Micro Hei" "Microsoft Yahei")
           when (font-installed-p font)
           return (set-fontset-font t '(#x4e00 . #x9fff) font)))

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
