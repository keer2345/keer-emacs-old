;;; init-ui.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq-default fill-column 80)

;; Title
;; (setq frame-title-format nil)
(setq frame-title-format '("Keer Emacs - %b")
      icon-title-format frame-title-format)

;; Menu/Tool/Scroll bars
(unless emacs/>=27p        ; Move to early init-file in 27
  (unless sys/mac-x-p
    (push '(menu-bar-lines . 0) default-frame-alist))
  (push '(tool-bar-lines . 0) default-frame-alist)
  (push '(vertical-scroll-bars) default-frame-alist))

;; Suppress GUI features
(setq use-file-dialog nil
      use-dialog-box nil
      inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t
      initial-scratch-message nil)


;; Change the echo message
(defun display-startup-echo-area-message ()
  (message "Emacs is powering up ... Be patient , Master %s !" keer-short-name))

(when sys/macp
  ;; Render thinner fonts
  (setq ns-use-thin-smoothing t)
  ;; Don't open a file in a new frame
  (setq ns-pop-up-frames nil))

;; initial window
(setq initial-frame-alist
      '((width . 110) ; characters in a line
        (height . 42))) ; number of lines
;; (setq initial-frame-alist '((top . 0) (left . 0) (width . 120) (height . 80)))

;; Fullscreen
;; WORKAROUND: To address blank screen issue with child-frame in fullscreen
(when (and sys/mac-x-p emacs/>=26p)
  (add-hook 'window-setup-hook (lambda ()
                                 (setq ns-use-native-fullscreen nil))))
(bind-keys ("M-S-<return>" . toggle-frame-fullscreen)
           ("C-S-<return>" . toggle-frame-maximized))

;; (when (and sys/linux-x-p emacs/>=26p)
;;   (add-to-list 'default-frame-alist '(fullscreen . maximized)))


;; Transparency
(global-set-key (kbd "C-M-6") (lambda () (interactive) (sanityinc/adjust-opacity nil -5)))
(global-set-key (kbd "C-M-7") (lambda () (interactive) (sanityinc/adjust-opacity nil 5)))
(global-set-key (kbd "C-M-8") (lambda () (interactive) (modify-frame-parameters nil `((alpha . 75)))))
(global-set-key (kbd "C-M-9") (lambda () (interactive) (modify-frame-parameters nil `((alpha . 100)))))

;; Don't use GTK+ tooltip
(when (boundp 'x-gtk-use-system-tooltips)
  (setq x-gtk-use-system-tooltips nil))


(provide 'init-ui)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ui.el ends here
