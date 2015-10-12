;;; init.el --- main config entry point
;;; Commentary:
;;; Code:

;;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(add-to-list 'load-path (locate-user-emacs-file "vendor/use-package"))
(require 'use-package)

;; Allow (require) for ELPA packages in init.el
(setq package-enable-at-startup nil)
(package-initialize)

(use-package restclient
  :load-path "vendor/restclient")

(use-package evil
  :load-path "vendor/evil"
  :init
  (evil-mode t))

(use-package magit)

(use-package flycheck
  :commands flycheck-mode
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'flycheck-mode))

;;; Theme
(load-theme 'base16-tomorrow-dark t)

;;; Editing
(setq-default
 ;; Never use tabs
 indent-tabs-mode nil

 ;; Wrap long lines
  truncate-lines nil)

(setq
 ;; Smoother scrolling
 scroll-margin 0
 scroll-step 1
 scroll-conservatively 10000
 scroll-preserve-screen-position 1)

(provide 'init)
;;; init.el ends here
