;; init.el ---- Init file

;; Author: Kennet Vuong
;; URL: https://github.com/knyyy/emacs.d/
;; Version: 0.1
;; Created: 2014-09-16
;; Credit: My files are created based on: 
;; - Magnar Sveen : https://github.com/magnars/.emacs.d/
;; ----

;; General settings to be load before os check


;; Check wheter emacs is running on mac/linux or windows
;;Psudo code: if mac-> Load mac settings, else if gnu linux -> load gnu
;;Everything after if else, is general load

;; Os check
(if (eq system-type 'darwin)
    (progn
      ;; change command to meta, and ignore option to use weird Norwegian keyboard
      (print "Running on mac")
      (require 'mac)
      ))

;; Settings to be load after os check
