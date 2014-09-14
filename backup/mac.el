;;My mac settings

(setq default-input-method "MacOSX")

;;Open window in front. 
(if window-system
    (x-focus-frame nil)
)

;; change command to meta, and ignore option to use weird Norwegian keyboard
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'hyper)

;; Norwegian mac-keyboard alt-keys)
(define-key key-translation-map (kbd "s-8") (kbd "["))
(define-key key-translation-map (kbd "s-(") (kbd "{"))
(define-key key-translation-map (kbd "s-9") (kbd "]"))
(define-key key-translation-map (kbd "s-)") (kbd "}"))
(define-key key-translation-map (kbd "s-7") (kbd "|"))
(define-key key-translation-map (kbd "s-/") (kbd "\\"))

;; fn-delete to be right delte
(global-set-key [kp-delete] 'delete-char) 
;;Stop the stupid mac bell
(setq ring-bell-function 'ignore)

;;Open files in same window
(setq ns-pop-up-frames nil)


 ;; scroll one line at a time (less "jumpy" than defaults)    
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time   
(provide 'mac)
