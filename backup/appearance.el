;;My emacs styles

;;Black background, white foregroud
(setq default-frame-alist
      (append default-frame-alist
       '((foreground-color . "White")
 (background-color . "Black")
 )))



;;Cursor vertical line, want box? just change to box.
(set-default 'cursor-type 'bar)

;;Linummode
(global-linum-mode 1)

;;Highlight parentheses, with dark orange color
(show-paren-mode 1)
(set-face-background 'show-paren-match-face "#ff8c00")
;;By default, there’s a small delay before showing a matching parenthesis. It can be deactivated with
(setq show-paren-delay 0)


;; turn on highlighting current line
(global-hl-line-mode 1) 
;;Only set color on highllighting when in window mode.
(if window-system
    (set-face-background 'hl-line "#222")
  )

(provide 'appearance)
