;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; (package-initialize)
(setq debug-on-error t)

;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(let ((minver "25.1")) 
  (when (version< emacs-version minver) 
    (error 
     "Your Emacs is too old -- this config requires v%s or higher"
     minver)))
;; (when (version< emacs-version "24.5")
;; (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

;; Speed up startup
(defvar keer-gc-cons-threshold (if (display-graphic-p) 8000000 800000) 
  "The default value to use for `gc-cons-threshold'. If you experience freezing,
  decrease this. If you experience stuttering, increase this.")

(defvar keer-gc-cons-upper-limit (if (display-graphic-p) 400000000 100000000) 
  "The temporary value for `gc-cons-threshold' to defer it.")

(defvar keer-gc-timer (run-with-idle-timer 10 t #'garbage-collect) 
  "Run garbarge collection when idle 10s.")

(defvar default-file-name-handler-alist file-name-handler-alist)

(setq file-name-handler-alist nil)
(setq gc-cons-threshold keer-gc-cons-upper-limit)

;; todo
;;(add-hook 'emacs-startup-hook
;;          (lambda ()
;;            "Restore defalut values after startup."
;;            (setq file-name-handler-alist default-file-name-handler-alist)
;;            (setq gc-cons-threshold keer-gc-cons-threshold)
;;
;;            ;; GC automatically while unfocusing the frame
;;            ;; `focus-out-hook' is obsolete since 27.1
;;            (if (boundp 'after-focus-change-function)
;;              (add-function :after after-focus-change-function
;;                            (lambda ()
;;                              (unless (frame-focus-state)
;;                                (garbage-collect))))
;;              (add-hook 'focus-out-hook 'garbage-collect))
;;
;;            ;; Avoid GCs while using `ivy'/`counsel'/`swiper' and `helm', etc.
;;            ;; @see http://bling.github.io/blog/2016/01/18/why-are-you-changing-gc-cons-threshold/
;;            (defun my-minibuffer-setup-hook ()
;;              (setq gc-cons-threshold keer-gc-cons-upper-limit))
;;
;;            (defun my-minibuffer-exit-hook ()
;;              (setq gc-cons-threshold keer-gc-cons-threshold))
;;
;;            (add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
;;            (add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)))

;; Load path
;; Optimize: Force "lisp"" and "site-lisp" at the head to reduce the startup time.

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; (defun update-load-path (&rest _)
;;   "Update `load-path'."
;;   (push (expand-file-name "site-lisp" user-emacs-directory) load-path)
;;   (push (expand-file-name "lisp" user-emacs-directory) load-path))
;;
;; (defun add-subdirs-to-load-path (&rest _)
;;   "Add subdirectories to `load-path'."
;;   (let ((default-directory
;;           (expand-file-name "site-lisp" user-emacs-directory)))
;;     (normal-top-level-add-subdirs-to-load-path)))
;;
;; (advice-add #'package-initialize :after #'update-load-path)
;; (advice-add #'package-initialize :after #'add-subdirs-to-load-path)
;;
;; (update-load-path)


;; (require 'init-benchmarking) ;; Measure startup time


;;----------------------------------------------------------------------------
;; Adjust garbage collection thresholds during startup, and thereafter
;;----------------------------------------------------------------------------
;; todo
;; (let ((normal-gc-cons-threshold (* 20 1024 1024))
;;       (init-gc-cons-threshold (* 128 1024 1024)))
;;   (setq gc-cons-threshold init-gc-cons-threshold)
;;   (add-hook 'after-init-hook
;;             (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))


;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


;; Constants
(require 'init-const)

;; Functions
(require 'init-funcs)

;; Customization
(require 'init-custom)

;; Packages
;; Without this comment Emacs25 adds (package-initialize) here
(require 'init-elpa)


;; Preferences
(require 'init-common)
(require 'init-util)

(require 'init-vcs)
(require 'init-hydra)
(require 'init-projectile)
(require 'init-flycheck)
(require 'init-company)
(require 'init-yasnippet)

(require 'init-ui)
(require 'init-theme)
(require 'init-modeline)
(require 'init-window)
(require 'init-highlight)

;; ivy swiper counsel
(require 'init-ivy)


;; edit
(require 'init-edit)

;; lang
(require 'lang-scala)
(require 'lang-lisp)

;; lang java
(require 'lang-java-meghanada)
;; (require 'lang-java-lsp)


;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(when (file-exists-p custom-file) 
  (load custom-file))

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here
