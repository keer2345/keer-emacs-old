;;; init-common.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Jump to things in Emacs tree-style
(use-package avy
  :bind (("C-:" . avy-goto-char)
         ("C-'" . avy-goto-char-2)
         ("M-g f" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)
         ("M-g e" . avy-goto-word-0))
  :hook (after-init . avy-setup-default)
  :config (setq avy-all-windows nil
                avy-all-windows-alt t
                avy-background t
                avy-style 'pre))

;; Kill text between the point and the character CHAR
(use-package avy-zap
  :bind (("M-z" . avy-zap-to-char-dwim)
         ("M-Z" . avy-zap-up-to-char-dwim)))

;; Jump to Chinese characters
(use-package ace-pinyin
  :diminish
  :hook (after-init . ace-pinyin-global-mode))



;; Minor mode to aggressively keep your code always indented
(use-package aggressive-indent
  :diminish
  :hook ((after-init . global-aggressive-indent-mode)
	 ;; FIXME: Disable in big files due to the performance issues
	 ;; https://github.com/Malabarba/aggressive-indent-mode/issues/73
	 (find-file . (lambda ()
			(if (> (buffer-size) (* 3000 80))
			    (aggressive-indent-mode -1)))))
  :config
  ;; Disable in some modes
  (dolist (mode '(asm-mode web-mode html-mode css-mode go-mode prolog-inferior-mode))
    (push mode aggressive-indent-excluded-modes))

  ;; Disable in some commands
  (add-to-list 'aggressive-indent-protected-commands #'delete-trailing-whitespace t)

  ;; Be slightly less aggressive in C/C++/C#/Java/Go/Swift
  (add-to-list
   'aggressive-indent-dont-indent-if
   '(and (or (derived-mode-p 'c-mode)
	     (derived-mode-p 'c++-mode)
	     (derived-mode-p 'csharp-mode)
	     (derived-mode-p 'java-mode)
	     (derived-mode-p 'go-mode)
	     (derived-mode-p 'swift-mode))
	 (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
			     (thing-at-point 'line))))))

(provide 'init-edit)
;;; init-common.el ends here
