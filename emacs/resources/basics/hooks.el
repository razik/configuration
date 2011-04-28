;;;;;;;;;;;
;; Hooks ;;
;;;;;;;;;;;

(add-hook 'write-file-hooks    'delete-trailing-whitespace)

(add-hook 'latex-mode-hook     'turn-on-auto-fill)
(add-hook 'changelog-mode-hook 'turn-on-auto-fill)
(add-hook 'c-mode-hook         'turn-on-auto-fill)
(add-hook 'c++-mode-hook       'turn-on-auto-fill)
(add-hook 'makefile-mode-hook  'turn-on-auto-fill)
