;; window mode stuff

;;Show full path
(setq frame-title-format '(buffer-file-name "%f" ("%b")))
(tooltip-mode -1)

;;Stop blinking
(blink-cursor-mode -1)

;;Open window in front. 
(x-focus-frame nil)
;; Set hl color
;;(set-face-background 'hl-line "#222")
(provide 'window-defaults)
