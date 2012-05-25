;;;;;;;;;;;;;
;; Desktop ;;
;;;;;;;;;;;;;

(setq desktop-load-locked-desktop t
      desktop-path '("~/.emacs.d/")
      desktop-dirname "~/.emacs.d/"
      desktop-base-file-name "desktop")

(desktop-save-mode 1)

;; Save desktop every 10 minutes
(run-with-timer (* 10 60) (* 10 60) (lambda () (flet ((message (&rest args) nil))
                                                 (desktop-save-in-desktop-dir))))
