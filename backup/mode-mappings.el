;;My mode mappings
;;How to add.
;;Autoload the mode, add it to list

;;Markdown
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;Javascript
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;Prolog mode
(add-to-list 'auto-mode-alist '("\\.pl\\'" . prolog-mode))

;;php mode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;;webmode, annen måte: require
(autoload 'web-mode "web-mode" "Major mode for editing web files." t)

;; HTML
(add-to-list 'auto-mode-alist '("\\.html\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.tag$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.vm$" . html-mode))

;;Emerald
;;(require 'emerald-mode)
(autoload 'emerald-mode "emerald-mode" "Major mode for editing emerald programs" t)
(add-to-list 'auto-mode-alist '("\\.m\\'" . emerald-mode))
;;Sassmode
;;(require 'haml-mode)
;;(autoload 'sass-mode "sass-mode" "Major mode for editing sass files." t)
;;(setq auto-mode-alist
  ;;    (append '(("\\.scss$" . sass-mode)) auto-mode-alist))
;;C# mode
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))
(provide 'mode-mappings)
