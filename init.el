(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(require 'evil)
(evil-mode t)

(load-theme 'base16-tomorrow-dark t)

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

(defun ensure-package-installed (&rest packages)
    "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
    (mapcar
     (lambda (package)
       (if (package-installed-p package)
	   nil
	 (if (y-or-n-p (format "Package %s is missing. Install it? " package))
	     (package-install package)
	   package)))
     packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

(ensure-package-installed 'evil
			  'iedit
                          'base16-theme)
