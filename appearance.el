;; By Kennet Vuong
;; Only set background and foreground or themes

;;(setq color-theme-is-global t)

;;Set paren match color to orange
(set-face-background 'show-paren-match-face "#ff8c00")



(add-to-list 'load-path (concat user-emacs-directory "themes/"))
(require 'color-theme-tomorrow)
(color-theme-tomorrow--define-theme night)

(provide 'appearance)
