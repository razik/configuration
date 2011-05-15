;;;;;;;;;;;;;;;;
;; C/C++ mode ;;
;;;;;;;;;;;;;;;;

(c-set-offset 'substatement-open 0)        ; change '{' indentation
(c-set-offset 'case-label '+)              ; case indent from switch
;;(setq c-auto-newline t)                    ; insert newline after ; { }
;;(setq c-tab-always-indent nil)             ; tab works better
;;(setq c-brace-offset -2)                   ; change '{' indentation
;;(setq c-label-offset 0)                    ; case indent from switch

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
