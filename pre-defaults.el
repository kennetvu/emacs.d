
;; Turn off mouse interface early
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1)) ;; Meny bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1)) ;; Toolbar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)) ;; Scroll (Not sure if I want this enabled or not)
;;No splashscreen
(setq inhibit-startup-message t)

(provide 'pre-defaults)
