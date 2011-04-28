;;;;;;;;;;;
;; CEDET ;;
;;;;;;;;;;;

;; See cedet/common/cedet.info for configuration details.
;; Enable EDE (Project Management) features
;; (global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)

;; This enables the database and idle reparse engines
(semantic-load-enable-minimum-features)

;; This enables some tools useful for coding, such as summary mode
;; imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)

;; This enables even more coding tools such as intellisense mode
;; decoration mode, and stickyfunc mode (plus regular code helpers)
(semantic-load-enable-gaudy-code-helpers)
