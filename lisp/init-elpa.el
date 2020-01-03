;;; init-elpa.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'cl)
(require 'package)


;; (setq package-archives '(("gnu"   . "https://mirrors.cloud.tencent.com/elpa/gnu/")
;;                          ("melpa" . "https://mirrors.cloud.tencent.com/elpa/melpa/")
;;                          ("marmalade" . "http://marmalade-repo.org/packages/")))

;; (setq package-archives '(("gnu"   . "http://mirrors.163.com/elpa/gnu/")
;;                          ("melpa" . "http://mirrors.163.com/elpa/melpa/")
;;                          ("melpa-stable" . "http://mirrors.163.com/elpa/melpa-stable/")
;;                          ("marmalade" . "http://mirrors.163.com/elpa/marmalade/")))

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/") 
			 ("melpa" . "http://elpa.emacs-china.org/melpa/") 
			 ("marmalade" . "http://marmalade-repo.org/packages/")))

;;(setq package-enable-at-startup nil)
;;(package-initialize)

;; Initialize packages
(unless (bound-and-true-p package--initialized) ; To avoid warnings in 27
  (setq package-enable-at-startup nil)          ; To prevent initializing twice
  (package-initialize))


;; Bootstrap `use-package'
(unless (package-installed-p 'use-package) 
  (package-refresh-contents) 
  (package-install 'use-package))

;; Should set before loading `use-package'
(eval-and-compile 
  (setq use-package-always-ensure t) 
  (setq use-package-always-defer t) 
  (setq use-package-expand-minimally t) 
  (setq use-package-enable-imenu-support t))

(eval-when-compile 
  (require 'use-package) 
  (setq use-package-verbose t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Copy from prelude's emacs
;;; https://github.com/bbatsov/prelude/blob/master/core/prelude-packages.el
;;;
(defvar prelude-packages '() 
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p () 
  "Check if all packages in `prelude-packages' are installed."
  (every #'package-installed-p prelude-packages))

(defun prelude-require-package (package) 
  "Install PACKAGE unless already installed."
  (unless (memq package prelude-packages) 
    (add-to-list 'prelude-packages package)) 
  (unless (package-installed-p package) 
    (package-install package)))

(defun prelude-require-packages (packages) 
  "Ensure PACKAGES are installed.
  Missing packages are installed automatically."
  (mapc #'prelude-require-package packages))

(defun prelude-install-packages () 
  "Install all packages listed in `prelude-packages'."
  (unless (prelude-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs Prelude is now refreshing its package database...") 
    (package-refresh-contents) 
    (message "%s" " done.")
    ;; install the missing packages
    (prelude-require-packages prelude-packages)))

;; run package installation
(prelude-install-packages)

;;; prelude emacs package end

(provide 'init-elpa)
;;; init-elpa.el ends here
