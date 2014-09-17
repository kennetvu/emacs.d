;;By magnars
;; https://github.com/magnars/.emacs.d/blob/master/themes/default-black-theme.el
;; Edited by Kennet Vuong
(deftheme default-black
  "Created 2014-09-18.")

(custom-theme-set-faces
 'default-black
 '(default ((t (:inherit nil :stipple nil :background "Black" :foreground "White" :inverse-video nil :box nil :strike-t*hrough nil :overline nil :underline nil :slant normal :weight normal :width normal))))
 '(highlight ((((class color) (min-colors 88) (background dark)) (:background "#111111"))))
 '(hl-line ((nil (:background "#222222")))))



(provide-theme 'default-black)
