;;; init-elpa.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)


;; (setq package-archives '(("gnu"   . "https://mirrors.cloud.tencent.com/elpa/gnu/")
;;                          ("melpa" . "https://mirrors.cloud.tencent.com/elpa/melpa/")
;;                          ("marmalade" . "http://marmalade-repo.org/packages/")))

(setq package-archives '(("gnu"   . "http://mirrors.163.com/elpa/gnu/")
                         ("melpa" . "http://mirrors.163.com/elpa/melpa/")
                         ("marmalade" . "http://mirrors.163.com/elpa/marmalade/")))

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

(eval-when-compile
  (require 'use-package)
  (setq use-package-verbose t))


(provide 'init-elpa)
;;; init-elpa.el ends here
