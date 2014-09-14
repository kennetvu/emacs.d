(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (package-initialize)
  )

(require 'tramp)
(setq tramp-default-method "ssh")
(provide 'setup-package)
