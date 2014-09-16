;; -- My-defaults
;; Based on Phil Hagelberg - https://github.com/technomancy/better-defaults

;; Turn off mouse interface early
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1)) ;; Meny bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1)) ;; Toolbar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)) ;; Scroll (Not sure if I want this enabled or not)
;;No splashscreen
(setq inhibit-startup-message t)


;;ido mode on
(ido-mode t)
(setq ido-enable-flex-matching t) ;; ido-enable-flex-matching means that if the entered string does not match any buffer name, any buffer name containing the entered characters in the given sequence will match.

;;Uniquify - https://www.gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward) ;;Instead of makefile<1> makefile<2>, its now tmp/makefile , opt/makefile

;;Saveplace http://www.emacswiki.org/emacs/SavePlace 
(require 'saveplace)
(setq-default save-place t) ;; Points goes to the last place.

(show-paren-mode 1)
(setq-default indent-tabs-mode nil)

;;If flash bell is annoying
;; (setq ring-bell-function 'ignore)
(setq x-select-enable-clipboard t ;;clipboard and killing/yank same
      x-select-enable-primary t ;; just another default to clipboard
      save-interprogram-paste-before-kill t ;;Another clipboard fix
      mouse-yank-at-point t ;; yank at cursor
      require-final-newline t ;; Adds newline end of file
      visible-bell t ;; Flashes screen instead of BEEP
      ediff-window-setup-function 'ediff-setup-windows-plain ;;diff settings, not sure if im using it,.http://www.emacswiki.org/emacs/EdiffMode
      save-place-file (concat user-emacs-directory "places") ;; Save place files to places
      backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups")))) ;; Where to place backups

(provide 'my-defaults)
