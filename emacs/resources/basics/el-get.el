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
      '(auto-complete
        (:name cedet
               :type bzr
               :url "bzr://cedet.bzr.sourceforge.net/bzrroot/cedet/code/trunk"
               :build ("make")
               :load-path ("./common")
               :features cedet)
        cmake-mode
        (:name ecb
               :type git
               :module "ecb"
               :url "git://github.com/razik/ecb.git"
               :build `(,(concat "make CEDET=~/.emacs.d/el-get/cedet" " EMACS=" el-get-emacs))
               :features ecb)
        el-get
        magit
        minimap
        nxhtml
        php-mode
        rainbow-mode
        (:name redo+
               :type elpa
               :after (lambda () (require 'redo+)))
        smex
        yaml-mode))

(el-get 'sync)
