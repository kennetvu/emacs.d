;;Settings for my emacs

;;Remove start screen
(setq inhibit-splash-screen t)

;;Make window 120x50 when emacs starts
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 115))

;; La meg svare y/n på ja/nei-spørsmål i stedet for yes/no.
(fset 'yes-or-no-p 'y-or-n-p)

;; Ingen blinkende tekstmarkør, takk.
(blink-cursor-mode 0)

;; Lim inn ved markøren istedenfor muspekeren når man bruker midtre musknapp.
(setq mouse-yank-at-point t)

(if window-system
    (tool-bar-mode               -1) ; No tool bar, please
		      ;(menu-bar-mode               -1) ; Also, no menu bar
  (column-number-mode           1) ; Show column number
)

;;Stop split windows when openning multiple files
(add-hook 'emacs-startup-hook
          (lambda () (delete-other-windows)) t)

;; delete seleted text when typing
(delete-selection-mode 1)


;;keep a list of recently opened files
(recentf-mode 1) 

;;(setq backup-directory-alist '(("." . "~/.emacs.d/backups"))) ; Make sure all backup files only live in one place
(setq make-backup-files nil) ; stop creating those backup~ files
;;(setq auto-save-default nil) ; stop creating those #autosave files


(provide 'settings)
