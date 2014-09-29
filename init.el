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
;; Keep custom mods in site-lisp?
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; Set path to dependencies
;(setq themes-dir
 ;     (expand-file-name "themes" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)
;;(add-to-list 'load-path themes-dir)

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("6916c4a030b103b0890030d183fdee57a8a1b4a0ecdfb5b81b86d2b7b387088d" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;(require 'neotree)
;(global-set-key [f8] 'neotree-toggle)
