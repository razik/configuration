;;;;;;;;;;;;;;;;;;
;; Key bindings ;;
;;;;;;;;;;;;;;;;;;

(global-set-key [f3]  'replace-string)       ; f3 = replace string
(global-set-key [f4]  'replace-regexp)       ; f4 = replace regexp

(global-set-key [f5]  'linum-mode)           ; f5 = linum-mode
(global-set-key [f6]  'reindent-file)        ; f6 = reindent file
(global-set-key [f7]  'goto-line)            ; f7 = goto line
(global-set-key [f8]  'kill-this-buffer)     ; f8 = kill this buffer

(global-set-key [f9]  'compile)              ; f9 = compile
(global-set-key [f10] 'recompile)            ; f10 = recompile
(global-set-key [f11] 'previous-error)       ; f11 = previous error
(global-set-key [f12] 'next-error)           ; f12 = next error

(global-set-key [M-right] 'yic-next-buffer)  ; meta-right = next buffer
(global-set-key [M-left] 'yic-prev-buffer)   ; meta-left = previous buffer
(global-set-key [(meta backspace)] 'backward-kill-word)

;;;;;;;;;;;;;;;;;;
;; Key commands ;;
;;;;;;;;;;;;;;;;;;

(global-set-key "\C-ch"         'c-header-ifndef)
(global-set-key (kbd "C-c C-u") 'uncomment-region)
(global-set-key (kbd "C-c C-c") 'comment-region)
