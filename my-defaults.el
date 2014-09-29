;; -- My-defaults
;; Based on Phil Hagelberg - https://github.com/technomancy/better-defaults


;;ido mode on
(ido-mode t)
(setq ido-enable-flex-matching t) ;; ido-enable-flex-matching means that if the entered string does not match any buffer name, any buffer name containing the entered characters in the given sequence will match.

;;Uniquify - https://www.gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward) ;;Instead of makefile<1> makefile<2>, its now tmp/makefile , opt/makefile

;;Saveplace http://www.emacswiki.org/emacs/SavePlace 
(require 'saveplace)
(setq-default save-place t) ;; Points goes to the last place.

;;Cursor vertical line, want box? just change to box.
(set-default 'cursor-type 'bar)

;; Paren mode
(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
;;By default, there’s a small delay before showing a matching parenthesis. It can be deactivated with
(setq show-paren-delay 0)

;; Hightlight current line
(global-hl-line-mode 1)

;;Linummode
(global-linum-mode 1)

;; Show column number
(column-number-mode 1)

;;Make window 120x50 when emacs starts
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 115))

;; La meg svare y/n på ja/nei-spørsmål i stedet for yes/no.
(fset 'yes-or-no-p 'y-or-n-p)

;;If flash bell is annoying
;; (setq ring-bell-function 'ignore)
(setq x-select-enable-clipboard t ;;clipboard and killing/yank same
      x-select-enable-primary t ;; just another default to clipboard
      save-interprogram-paste-before-kill t ;;Another clipboard fix
      mouse-yank-at-point t ;; yank at cursor
      require-final-newline t ;; Adds newline end of file
      visible-bell t ;; Flashes screen instead of BEEP
      ediff-window-setup-function 'ediff-setup-windows-plain ;;diff settings, not sure if im using it,.http://www.emacswiki.org/emacs/EdiffMode
      save-place-file (concat user-emacs-directory ".places") ;; Save place files to places
      backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))) ;; Where to place backups
      vc-make-backup-files t ;; Make backups of files, even when they're in version control
)

;;Stop split windows when openning multiple files
(add-hook 'emacs-startup-hook
          (lambda () (delete-other-windows)) t)

;; delete seleted text when typing
(delete-selection-mode 1)

;;keep a list of recently opened files
(recentf-mode 1) 
(setq recentf-max-saved-items 50) ;; just 20 is too recent
;; Lines should be 80 characters wide, not 72
(setq fill-column 80)

;; Easily navigate sillycased words
(global-subword-mode 1)

;; Don't break lines for me, please
(setq-default truncate-lines t)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

(provide 'my-defaults)
