;;;;;;;;;
;; IDO ;;
;;;;;;;;;

(ido-mode t)
(setq ido-create-new-buffer 'always
      ido-enable-flex-matching t)
(ido-mode 'both)
(ido-everywhere 1)
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
