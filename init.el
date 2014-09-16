;; -----
;; Emacs settings
;; By Kennet Vuong
;; ----

;; General settings to be load before os check


;; Check wheter emacs is running on mac/linux or windows
;;Psudo code: if mac-> Load mac settings, else if gnu linux -> load gnu
;;Everything after if else, is general load
;; change command to meta, and ignore option to use weird Norwegian keyboard
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'hyper)


;; Settings to be load after os check
