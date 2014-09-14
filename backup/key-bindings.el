;;Key bindings

;;set the keybinding so that you can use f4 for goto line
(global-set-key [f4] 'goto-line)
;;set the keybinding so that f3 will start the shell
(global-set-key [f3] 'shell)

(global-set-key (kbd "M-a") 'beginning-of-line)
(global-set-key (kbd "M-e") 'end-of-line)
(global-set-key [(meta up)] 'beginning-of-buffer)
(global-set-key [(meta down)] 'end-of-buffer)
(global-set-key [(meta left)] 'beginning-of-line)
(global-set-key [(meta right)] 'end-of-line)


(provide 'key-bindings)
