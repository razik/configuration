;;;;;;;;;;;;;
;; Minimap ;;
;;;;;;;;;;;;;

(require 'minimap)

(setq minimap-always-recenter           t)
(setq minimap-display-semantic-overlays nil)
(setq minimap-hide-fringes              nil)
(setq minimap-stay-at-beginning-of-line t)
(setq minimap-update-delay              0.1)
(setq minimap-width-fraction            0.1)
(setq minimap-window-location           'right)

(global-set-key [f2] 'minimap-toggle)
