;; init.el ---- Init file

;; Author: Kennet Vuong
;; URL: https://github.com/knyyy/emacs.d/
;; Version: 0.1
;; Created: 2014-09-16
;; Credit: My files are created based on: 
;; - Magnar Sveen : https://github.com/magnars/.emacs.d/
;; - Phil Hagelberg - https://github.com/technomancy/better-defaults
;; ----

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; Set path to dependencies
(setq themes-dir
      (expand-file-name "themes" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)
(add-to-list 'load-path themes-dir)

;; Load pre defaults
(require 'pre-defaults)

;;Load my defaults settings
(require 'my-defaults)

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;;Load mac settings
(when is-mac  (require 'mac))

;;Load settings when running emacs in window
(when window-system (require 'window-defaults))

;;Load appearance
(require 'appearance)

;; Load keybindings
(require 'key-bindings)
;; Setup packages
;;(require 'setup-package)
