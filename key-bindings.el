;;set the keybinding so that you can use f4 for goto line
(global-set-key [f4] 'goto-line)
;;set the keybinding so that f3 will start the shell
(global-set-key [f3] 'shell)

(global-set-key [(meta up)] 'beginning-of-buffer)
(global-set-key [(meta down)] 'end-of-buffer)
;;(global-set-key [(meta left)] 'beginning-of-line)
;;(global-set-key [(meta right)] 'end-of-line)

;; Use shell-like backspace C-h, rebind help to F1
(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "<f1>") 'help-command)

(provide 'key-bindings)
