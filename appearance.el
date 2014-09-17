;; By Kennet Vuong
;; Only set background and foreground or themes

(setq color-theme-is-global t)

;;Set paren match color to orange
(set-face-background 'show-paren-match-face "#ff8c00")



;;(add-to-list 'load-path (concat user-emacs-directory "themes"))
;;(require 'color-theme-tomorrow)
;;(color-theme-tomorrow--define-theme night)
;; Set custom theme path
(setq custom-theme-directory (concat user-emacs-directory "themes"))

(dolist
    (path (directory-files custom-theme-directory t "\\w+"))
  (when (file-directory-p path)
    (add-to-list 'custom-theme-load-path path)))

(defun use-default-theme ()
  (load-theme 'default-black t))

(if window-system (use-default-theme))
(provide 'appearance)
