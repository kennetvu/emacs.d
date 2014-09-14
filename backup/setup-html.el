;;Setup my html enviroment


(add-hook 'html-mode-hook
	  (lambda ()
	    ;; Default indentation is usually 2 spaces, changing to 4.
	    (set (make-local-variable 'sgml-basic-offset) 4)))

;;Highlight tags
(require 'hl-tags-mode)
(add-hook 'sgml-mode-hook (lambda () (hl-tags-mode 1)))
(add-hook 'nxml-mode-hook (lambda () (hl-tags-mode 1)))
;;(set-face-background 'hl-tags "#333333")

;;Emmet 
;; ctrl-j to active
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
;;If you want the cursor to be positioned between first empty quotes after expanding:
(setq emmet-move-cursor-between-quotes t) ;; default nil

;;Webmode
(require 'web-mode)

;;Sass mode
(require 'sass-mode)
;;scss mode
(require 'scss-mode)

(provide 'setup-html)
