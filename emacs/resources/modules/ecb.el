;;;;;;;;;
;; ECB ;;
;;;;;;;;;

(global-set-key [f1] 'ecb-toggle)

;; Custom variables
(custom-set-variables
 '(ecb-options-version "2.40"))

;; ECB options
(setq ecb-tip-of-the-day nil
      ecb-history-make-buckets (quote never)
      ecb-layout-name "leftright2"
      ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1)
      ecb-layout-window-sizes (quote(("leftright2"
                                      (ecb-directories-buffer-name 0.16 . 0.65)
                                      (ecb-sources-buffer-name 0.16 . 0.35)
                                      (ecb-methods-buffer-name 0.20 . 0.65)
                                      (ecb-history-buffer-name 0.20 . 0.35)))))

;; ECB toggling
(defun ecb-toggle ()
  (interactive)
  (if (eq ecb-minor-mode
          nil)
      (ecb-activate)
    (ecb-deactivate)
    ))
