;;;;;;;;;
;; IDO ;;
;;;;;;;;;

(ido-mode t)
(ido-mode 'both)
(ido-everywhere 1)

(setq ido-create-new-buffer 'always
      ido-enable-flex-matching t
      ido-default-file-method 'selected-window
      ido-default-buffer-method 'selected-window)
