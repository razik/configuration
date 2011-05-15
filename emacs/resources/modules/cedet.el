;;;;;;;;;;;
;; CEDET ;;
;;;;;;;;;;;

;;;;
;; Srecode
;;;;

(global-srecode-minor-mode 1)                  ;; Enable SRecode (Template management) minor-mode.

;;;;
;; Semantic
;;;;

(require 'semantic-gcc)
(require 'semantic-ia)

;; defaults
(semantic-load-enable-minimum-features)        ;; This enables the database and idle reparse engines
(semantic-load-enable-code-helpers)            ;; This enables some tools useful for coding, such as summary mode,
                                               ;;  imenu support, and the semantic navigator
(semantic-load-enable-gaudy-code-helpers)      ;; This enables even more coding tools such as intellisense mode,
                                               ;;  decoration mode, and stickyfunc mode (plus regular code helpers)

;; more customization
(global-semantic-folding-mode 1)
(global-semantic-mru-bookmark-mode 1)

(setq-mode-local c-mode   semanticdb-find-default-throttle '(file local project unloaded system recursive omniscience))
(setq-mode-local c++-mode semanticdb-find-default-throttle '(file local project unloaded system recursive omniscience))

;; eassist customization
(require 'eassist)
(add-to-list 'eassist-header-switches '("cc" "hh"))
(add-to-list 'eassist-header-switches '("hh" "cc" "hxx"))
(add-to-list 'eassist-header-switches '("hxx" "hh"))

;; 3rdParty - global
(require 'semanticdb-global)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)

;; 3rdParty - ctags
(require 'semanticdb-ectag)
(semantic-load-enable-primary-exuberent-ctags-support)

;; semantic hooks
(defun semantic-ia-fast-jump-back ()
  (interactive)
  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
      (error "Semantic Bookmark ring is currently empty"))
  (let* ((ring (oref semantic-mru-bookmark-ring ring))
         (alist (semantic-mrub-ring-to-assoc-list ring))
         (first (cdr (car alist))))
    ;; (if (semantic-equivalent-tag-p (oref first tag) (semantic-current-tag))
    ;;     (setq first (cdr (car (cdr alist)))))
    (semantic-mrub-visit first)
    (ring-remove ring 0)))

(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c?"            'semantic-ia-complete-symbol)

  (local-set-key "\C-c>"            'semantic-complete-analyze-inline)
  (local-set-key "\C-c="            'semantic-decoration-include-visit)

  (local-set-key "\C-cb"            'semantic-mrub-switch-tags)
  (local-set-key "\C-cq"            'semantic-ia-show-doc)
  (local-set-key "\C-cs"            'semantic-ia-show-summary)
  (local-set-key "\C-cp"            'semantic-analyze-proto-impl-toggle)
  (local-set-key "\C-cr"            'semantic-symref)

  (local-set-key "\C-c\-"           'senator-fold-tag)
  (local-set-key "\C-c\+"           'senator-unfold-tag)

  (local-set-key (kbd "C-j")        'semantic-ia-fast-jump)
  (local-set-key (kbd "M-j")        'semantic-ia-fast-jump-back)
  )
(add-hook 'c-mode-common-hook   'my-cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'my-cedet-hook)

;; c-mode hooks
(defun my-c-mode-cedet-hook ()
  (local-set-key "\C-xt"    'eassist-switch-h-cpp)
  (local-set-key "\C-c\C-r" 'semantic-symref)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

;; system includes
(semantic-add-system-include "~/local/include" 'c-mode)
(semantic-add-system-include "~/local/include" 'c++-mode)

(defun recur-list-files (dir re)
  "Returns list of files in directory matching to given regex"
  (when (file-accessible-directory-p dir)
    (let ((files (directory-files dir t))
          matched)
      (dolist (file files matched)
        (let ((fname (file-name-nondirectory file)))
          (cond
           ((or (string= fname ".")
                (string= fname "..")) nil)
           ((and (file-regular-p file)
                 (string-match re fname))
            (setq matched (cons file matched)))
           ((file-directory-p file)
            (let ((tfiles (recur-list-files file re)))
              (when tfiles (setq matched (append matched tfiles)))))))))))

(defun c++-setup-boost (boost-root)
  (when (file-accessible-directory-p boost-root)
    (let ((cfiles (recur-list-files boost-root "\\(config\\|user\\)\\.hpp")))
      (dolist (file cfiles)
        (add-to-list 'semantic-lex-c-preprocessor-symbol-file file)))))


;; EDE

;; See cedet/common/cedet.info for configuration details.
;; Enable EDE (Project Management) features
;; (global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")
