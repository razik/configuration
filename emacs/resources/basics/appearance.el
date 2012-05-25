;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Colors, style and font ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe-mode (quote (0 . 0)) nil (fringe)))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ace-jump-face-foreground ((t (:foreground "Turquoise"))))
 '(background "Blue")
 '(ecb-default-highlight-face ((t (:background "White" :foreground "Black"))))
 '(ecb-tag-header-face ((t (:background "#363636"))))
 '(font-lock-builtin-face ((((class color) (background dark)) (:foreground "Turquoise"))))
 '(font-lock-comment-face ((t (:foreground "DarkGray"))))
 '(font-lock-constant-face ((((class color) (background dark)) (:bold t :foreground "DarkOrchid"))))
 '(font-lock-doc-string-face ((t (:foreground "Green2"))))
 '(font-lock-function-name-face ((t (:foreground "SkyBlue"))))
 '(font-lock-keyword-face ((t (:bold t :foreground "CornflowerBlue"))))
 '(font-lock-operator-face ((t (:foreground "#FFDC5F"))))
 '(font-lock-number-face ((t (:foreground "#E03D6F"))))
 '(font-lock-preprocessor-face ((t (:italic nil :foreground "CornFlowerBlue"))))
 '(font-lock-string-face ((t (:foreground "Gold"))))
 '(font-lock-type-face ((t (:foreground "#9290ff"))))
 '(font-lock-variable-name-face ((t (:foreground "PaleGreen"))))
 '(font-lock-warning-face ((((class color) (background dark)) (:foreground "Yellow" :background "Red"))))
 '(highlight ((t (:background "CornflowerBlue"))))
 '(isearch ((t (:background "#ce5c00" :foreground "Black"))))
 '(lazy-highlight ((t (:background "#e9b96e" :foreground "Black"))))
 '(list-mode-item-selected ((t (:background "Gold"))))
 '(minimap-active-region-background ((t (:background "#333333"))))
 '(makefile-space-face ((t (:background "Wheat"))))
 '(mini ((((background dark)) (:background "#222222"))))
 '(mode-line ((t (:background "Navy"))))
 '(paren-match ((t (:background "Darkseagreen4"))))
 '(region ((t (:background "DarkSlateBlue"))))
 '(semantic-decoration-on-fileless-includes ((t (:background "#1E4D2B" :weight bold))))
 '(semantic-decoration-on-unknown-includes ((t (:background "DarkRed" :weight bold))))
 '(semantic-decoration-on-unparsed-includes ((((class color) (background dark)) (:background "#222222" :weight bold))))
 '(show-paren-match ((t (:foreground "Black" :background "Wheat"))))
 '(show-paren-mismatch ((((class color)) (:foreground "White" :background "Red"))))
 '(speedbar-button-face ((((class color) (background dark)) (:foreground "Green4"))))
 '(speedbar-directory-face ((((class color) (background dark)) (:foreground "Khaki"))))
 '(speedbar-file-face ((((class color) (background dark)) (:foreground "Cyan"))))
 '(speedbar-tag-face ((((class color) (background dark)) (:foreground "Springgreen"))))
 '(vhdl-speedbar-architecture-selected-face ((((class color) (background dark)) (:underline t :foreground "Blue"))))
 '(vhdl-speedbar-entity-face ((((class color) (background dark)) (:foreground "DarkGreen"))))
 '(vhdl-speedbar-entity-selected-face ((((class color) (background dark)) (:underline t :foreground "DarkGreen"))))
 '(vhdl-speedbar-package-face ((((class color) (background dark)) (:foreground "Black"))))
 '(vhdl-speedbar-package-selected-face ((((class color) (background dark)) (:underline t :foreground "Black"))))
 '(widget-field ((((class grayscale color) (background light)) (:background "DarkBlue")))))

(setq background-color "#111111")

(add-to-list 'default-frame-alist '(background-color . "#111111"))
(add-to-list 'default-frame-alist '(foreground-color . "White"))
(add-to-list 'default-frame-alist '(cursor-color . "Steelblue"))

;; Fonts

(if (not (eq system-type 'darwin))
    (if (>= emacs-major-version 23)
        (add-to-list 'default-frame-alist '(font . "Bitstream Vera Sans Mono-8")))
  (set-face-font 'default "-apple-proggytiny-medium-r-normal--12-110-72-72-m-110-iso10646-1"))
