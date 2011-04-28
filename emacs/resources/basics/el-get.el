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

(setq el-get-sources
      '(cmake-mode
        el-get
        magit
        nxhtml
        php-mode
        smex

        (:name redo+
               :type elpa
               :after (lambda () (require 'redo+)))

        (:name cedet
               :type bzr
               :url "bzr://cedet.bzr.sourceforge.net/bzrroot/cedet/code/cedet-1.0"
               :build ("make")
               :load-path ("./common")
               :autoloads nil
               :features cedet)

        (:name ecb
               :type cvs
               :module "ecb"
               :url ":pserver:anonymous@ecb.cvs.sourceforge.net:/cvsroot/ecb"
               :build `(,(concat "make CEDET=~/.emacs.d/el-get/cedet" " EMACS=" el-get-emacs))
               :features ecb)
        ))

(el-get 'sync)
