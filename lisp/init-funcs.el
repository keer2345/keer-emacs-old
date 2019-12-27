;;; init-common.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Font
(defun font-installed-p (font-name)
  "Check if font with FONT-NAME is available."
  (find-font (font-spec :name font-name)))


(provide 'init-funcs)
;;; init-funcs.el ends here
