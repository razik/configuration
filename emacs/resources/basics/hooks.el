;;;;;;;;;;;
;; Hooks ;;
;;;;;;;;;;;

;; Delete trailing whitespaces
(add-hook 'write-file-hooks    'delete-trailing-whitespace)

;;
;; Highlight watchwords
;;

(defun highlight-watchwords()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\|XXX\\):" . font-lock-warning-face))
   t))

(add-hook 'c-mode-common-hook   'highlight-watchwords)
(add-hook 'cmake-mode-hook      'highlight-watchwords)
(add-hook 'emacs-lisp-mode-hook 'highlight-watchwords)
(add-hook 'js-mode-hook         'highlight-watchwords)
(add-hook 'ruby-mode-hook       'highlight-watchwords)

;;
;; Highlight operators
;;

(defvar font-lock-operator-face 'font-lock-operator-face)

(defface font-lock-operator-face
  '((t (:inherit 'font-lock-function-name-face)))
  "Basic face for highlighting operators."
  :group 'font-lock-faces)

(defun highlight-operators-c-common()
  (font-lock-add-keywords
   nil '(("[-+*/=.&%$?~!|<>:^,]" . font-lock-operator-face))
   t))

(defun highlight-operators-emacs-lisp()
  (font-lock-add-keywords
   nil '(("['#,`]" . font-lock-operator-face))
   t))

(defun highlight-operators-ruby()
  (font-lock-add-keywords
   nil '(("[-+*/%=!<>]" . font-lock-operator-face))
   t))

(defun highlight-operators-cmake()
  (font-lock-add-keywords
   nil '(("[$]" . font-lock-operator-face))
   t))

(add-hook 'c-mode-common-hook   'highlight-operators-c-common)
(add-hook 'js-mode-hook         'highlight-operators-c-common)
(add-hook 'ruby-mode-hook       'highlight-operators-cmake)
(add-hook 'emacs-lisp-mode-hook 'highlight-operators-emacs-lisp)
(add-hook 'ruby-mode-hook       'highlight-operators-ruby)

;;
;; Highlight numbers
;;

(defvar font-lock-number-face 'font-lock-number-face)

(defface font-lock-number-face
  '((t (:inherit 'font-lock-constant-face)))
  "Basic face for highlighting numbers."
  :group 'font-lock-faces)

(defun highlight-numbers()
  (font-lock-add-keywords
   nil '(("\\b\\(\\(\\(0\\(x\\|X\\)[0-9a-fA-F]*\\)\\|\\(\\([0-9]+\\.?[0-9]*\\)\\|\\(\\.[0-9]+\\)\\)\\(\\(e\\|E\\)\\(\\+\\|-\\)?[0-9]+\\)?\\)\\(L\\|l\\|UL\\|ul\\|u\\|U\\|F\\|f\\|ll\\|LL\\|ull\\|ULL\\)?\\)\\b" 1 font-lock-number-face))
   t))

(add-hook 'c-mode-common-hook   'highlight-numbers)
(add-hook 'cmake-mode-hook      'highlight-numbers)
(add-hook 'emacs-lisp-mode-hook 'highlight-numbers)
(add-hook 'js-mode-hook         'highlight-numbers)
(add-hook 'ruby-mode-hook       'highlight-numbers)
