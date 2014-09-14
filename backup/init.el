;;My emacs settings
;; Only works with emacs version >= 23
;;todo:
;;Org mode, snippet, SMEX, IDO

;; fiks webmode?
;; Set path to dependencies

(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; Set up load path
;;(add-to-list 'load-path user-emacs-directory)
;(add-to-list 'load-path site-lisp-dir)

;;New way for emacs ? 
;;(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)
;;Open emacs in front
;;(require 'sass-mode)

;; Better emacs
(require 'better-defaults)
;;Emacs settings
(require 'settings)
;;Package
(require 'setup-package)

;;Emacs styles
(require 'appearance)
;;Mac settings
(require 'mac)
;;Key bindings
(require 'key-bindings)
;;mode mappings
(require 'mode-mappings)
;;Html setup
(require 'setup-html)
;;Misc
(require 'misc)

;;(require 'emerald-mode)
;;Setup ido mode
(require 'setup-ido)
; start speedbar if we're using a window system
;;(when window-system      
;;    (speedbar t))

;;Rectangle mode so strong!
;; Mark -> C-x r t

;;
;;If you always want the abbrev mode on
;;(setq default-abbrev-mode t)

(abbrev-mode 1)
(dolist (hook '(python-mode-hook
		;;html-helper-mode-hook
		;;LaTeX-mode-hook
		;;ruby-mode-hook
		;;emacs-lisp-mode-hook
		;;text-mode-hook
		))
  (add-hook hook (lambda () (abbrev-mode 1) )))



; Custom hideshow keyboard bindings.
; This allows me to use C-c and the arrow keys to hide and show blocks.
; It ignores the Ctrl when hitting the arrow keys (double binding).
(defun hideshow-on()
    (load-library "hideshow")
    (local-set-key (kbd "C-c <right>") 'hs-show-block)
    (local-set-key (kbd "C-c C-<right>") 'hs-show-block)
    (local-set-key (kbd "C-c <left>")  'hs-hide-block)
    (local-set-key (kbd "C-c C-<left>")  'hs-hide-block)
    (local-set-key (kbd "C-c <up>")    'hs-hide-all)
    (local-set-key (kbd "C-c C-<up>")    'hs-hide-all)
    (local-set-key (kbd "C-c <down>")  'hs-show-all)
    (local-set-key (kbd "C-c C-<down>")  'hs-show-all)
;; Hide the comments too when you do a 'hs-hide-all'
    (setq hs-hide-comments nil)
    (hs-minor-mode t))

; Turn on hideshow mode for certain languages
(add-hook 'java-mode-hook 'hideshow-on)
(add-hook 'perl-mode-hook 'hideshow-on)
(add-hook 'emacs-lisp-mode-hook 'hideshow-on)
(add-hook 'python-mode-hook 'hideshow-on)
(add-hook 'c-mode-hook 'hideshow-on)

;;Use by call M-x reload-dotemacs-file
(defun reload-dotemacs-file ()
  "reload your .emacs file without restarting Emacs"
  (interactive)
  (load-file "~/.emacs.d/init.el") )

;; -----
;; Show filename in titlebar.
;; -----
;; %f=filename %b=buffer name
;;(setq USERNAME (getenv "USER"))
;;(setq HOSTNAME (substring (system-name) 0 (string-match "\\." (system-name))))
;;(setq EMACS "emacs")

;;(setq frame-title-format `(,EMACS "["USERNAME "@" HOSTNAME "]: "
;;      (buffer-file-name "%f"
;;          (dired-directory dired-directory
;;           "%b"))))





