;;;;;;;;;;;;;
;; Options ;;
;;;;;;;;;;;;;

(setq inhibit-startup-message t)          ; don't show the GNU splash screen
(scroll-bar-mode -1)                      ; no scroll bar
(menu-bar-mode -1)                        ; no menu bar
(tool-bar-mode -1)                        ; no tool bar
(setq frame-title-format "%b")            ; titlebar shows buffer's name
(global-font-lock-mode t)                 ; syntax highlighting
(setq font-lock-maximum-decoration t)     ; maximum decoration for all modes
(show-paren-mode t)                       ; show opposing paren while hovering
(setq scroll-step 1)                      ; smooth scrolling
(delete-selection-mode t)                 ; typing removes highlighted text
(line-number-mode t)                      ; display line number in modeline
(column-number-mode t)                    ; display column number in modeline
(setq display-time-day-and-date t)        ; display date in modeline
(setq display-time-24hr-format t)         ; european 24h format
(display-time)                            ; display time in modeline
(auto-compression-mode t)                 ; open compressed files
(mouse-wheel-mode t)                      ; enable mouse wheel
(fset 'yes-or-no-p 'y-or-n-p)             ; 'y or n' instead of 'yes or no'
(setq default-major-mode 'text-mode)      ; change default major mode to text
(setq ring-bell-function 'ignore)         ; turn the alarm totally off
(setq backup-inhibited t)                 ; no backupfile
(setq make-backup-files nil)              ; no backupfile
(setq delete-auto-save-files t)           ; delete unnecessary autosave files
(setq delete-old-versions t)              ; delete oldversion file
(setq next-line-add-newlines nil)         ; prevents new line after eof
(global-auto-revert-mode t)               ; auto revert modified files
(pc-selection-mode)                       ; pc-style selection mode
(setq compilation-scroll-output t)        ; autoscroll compilation window
(set-input-mode nil nil 1)                ; mode for reading keyboard input
(setq-default indent-tabs-mode nil)	  ; space indentation

(if window-system
    (normal-erase-is-backspace-mode 1))   ; make delete work as it should
