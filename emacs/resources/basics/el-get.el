;;;;;;;;;;;;
;; el-get ;;
;;;;;;;;;;;;

(if (not (file-directory-p "~/.emacs.d/el-get"))
    (progn
      (set-buffer
       (url-retrieve-synchronously
        "https://github.com/dimitri/el-get/raw/master/el-get-install.el"))
      (end-of-buffer)
      (eval-print-last-sexp)))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(require 'el-get)

;; local sources
(setq el-get-sources
      '((:name cedet
               :type bzr
               :url "bzr://cedet.bzr.sourceforge.net/bzrroot/cedet/code/trunk"
               :build ("make")
               :load-path ("./common")
               :features cedet)
        (:name ecb
               :type git
               :module "ecb"
               :url "git://github.com/razik/ecb.git"
               :build `(,(concat "make CEDET=~/.emacs.d/el-get/cedet" " EMACS=" el-get-emacs))
               :features ecb)
        (:name jade-mode
               :type git
               :url "https://github.com/brianc/jade-mode.git")
        (:name keyfreq
               :type http
               :url "http://ergoemacs.googlecode.com/svn/trunk/packages/keyfreq.el")
        (:name minimap
               :type git
               :url "git://github.com/razik/emacs-minimap.git")
        (:name rainbow-mode
	       :type elpa)
        (:name redo+
               :type elpa
               :after (lambda () (require 'redo+)))
        (:name window-numbering
               :type http
               :url "http://nschum.de/src/emacs/window-numbering-mode/window-numbering.el"
               :features window-numbering)
        (:name yasnippet
               :website "https://github.com/capitaomorte/yasnippet.git"
               :description "YASnippet is a template system for Emacs."
               :type git
               :url "https://github.com/capitaomorte/yasnippet.git"
               :features "yasnippet"
               :prepare (lambda ()
                          (unless (or (boundp 'yas/snippet-dirs) (get 'yas/snippet-dirs 'customized-value))
                            (setq yas/snippet-dirs
                                  (list (concat el-get-dir (file-name-as-directory "yasnippet") "snippets")))))
               :post-init (lambda ()
                            (put 'yas/snippet-dirs 'standard-value
                                 (list (list 'quote
                                             (list (concat el-get-dir (file-name-as-directory "yasnippet") "snippets"))))))
               :compile nil)
        ))

(setq my-packages
      (append
       '(ace-jump-mode
         auto-complete
         cmake-mode
         cedet
         ecb
         el-get
         highlight-indentation
         highlight-parentheses
         hlinum
         jade-mode
         keyfreq
         magit
         minimap
         nxhtml
         php-mode
         rainbow-mode
         redo+
         smex
         smooth-scrolling
         window-numbering
         yaml-mode
         yasnippet
         )
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)
