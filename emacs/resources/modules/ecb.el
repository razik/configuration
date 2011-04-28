;;;;;;;;;
;; ECB ;;
;;;;;;;;;

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-compile-window-height 12)
 '(ecb-compile-window-width (quote edit-window))
 '(ecb-layout-name "leftright2")
 '(ecb-layout-window-sizes nil)
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-tip-of-the-day nil))

(defun switch-ecb-state ()
  (interactive)
  (if (eq ecb-minor-mode
          nil)
      (ecb-activate)
    (ecb-deactivate)
    ))

(global-set-key [f1] 'switch-ecb-state)
