;;;;;;;;;;;;
;; NXHTML ;;
;;;;;;;;;;;;

(add-hook 'nxhtml-mumamo-mode-hook '(lambda ()
                                      (setq mumamo-background-colors nil)
                                      (font-lock-mode 0)
                                      (font-lock-mode 1)))
