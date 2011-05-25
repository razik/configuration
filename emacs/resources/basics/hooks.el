;;;;;;;;;;;
;; Hooks ;;
;;;;;;;;;;;

(add-hook 'write-file-hooks    'delete-trailing-whitespace)

;; autofill
(add-hook 'latex-mode-hook     'turn-on-auto-fill)
(add-hook 'changelog-mode-hook 'turn-on-auto-fill)
(add-hook 'c-mode-hook         'turn-on-auto-fill)
(add-hook 'c++-mode-hook       'turn-on-auto-fill)
(add-hook 'makefile-mode-hook  'turn-on-auto-fill)

;; watchwords
(add-hook 'c-mode-hook          'add-watchwords)
(add-hook 'c++-mode-hook        'add-watchwords)
(add-hook 'cmake-mode-hook      'add-watchwords)
(add-hook 'emacs-lisp-mode-hook 'add-watchwords)
(add-hook 'java-mode-hook       'add-watchwords)
(add-hook 'js-mode-hook         'add-watchwords)
(add-hook 'ruby-mode-hook       'add-watchwords)
