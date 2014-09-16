;; init.el ---- Init file

;; Author: Kennet Vuong
;; URL: https://github.com/knyyy/emacs.d/
;; Version: 0.1
;; Created: 2014-09-16
;; Credit: My files are created based on: 
;; - Magnar Sveen : https://github.com/magnars/.emacs.d/
;; - Phil Hagelberg - https://github.com/technomancy/better-defaults
;; ----

;; General settings to be load before os check


;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)

;;Load my defaults settings
(require 'my-defaults)

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;;Load mac settings
(when is-mac  (require 'mac))

;; Settings to be load after os check
