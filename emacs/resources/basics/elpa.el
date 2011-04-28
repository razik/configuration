;;;;;;;;;;
;; ELPA ;;
;;;;;;;;;;

(if (not (file-directory-p "~/.emacs.d/elpa"))
    (progn
      (let ((my-archive-base "http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/")
            (my-user-dir (expand-file-name "~/.emacs.d/elpa")))

        (require 'pp)
        (let ((download
               (lambda (url)
                 (if (fboundp 'url-retrieve-synchronously)
                     ;; Use URL to download.
                     (let ((buffer (url-retrieve-synchronously url)))
                       (save-excursion
                         (set-buffer buffer)
                         (goto-char (point-min))
                         (re-search-forward "^$" nil 'move)
                         (forward-char)
                         (delete-region (point-min) (point))
                         buffer))
                   ;; Use wget to download.
                   (save-excursion
                     (with-current-buffer
                         (get-buffer-create
                          (generate-new-buffer-name " *Download*"))
                       (shell-command (concat "wget -q -O- " url)
                                      (current-buffer))
                       (goto-char (point-min))
                       (current-buffer)))))))

          ;; Make the ELPA directory.
          (make-directory my-user-dir t)

          ;; Download package.el and put it in the user dir.
          (let ((pkg-buffer (funcall download (concat my-archive-base "package.el"))))
            (save-excursion
              (set-buffer pkg-buffer)
              (setq buffer-file-name
                    (concat (file-name-as-directory my-user-dir)
                            "package.el"))
              (save-buffer)
              (kill-buffer pkg-buffer)))

          ;; Load package.el.
          (load (expand-file-name "~/.emacs.d/elpa/package.el"))

          ;; Download URL package if we need it.
          (unless (fboundp 'url-retrieve-synchronously)
            ;; Note that we don't name the symbol "url-version", as that
            ;; will cause us not to define the real url-version when
            ;; url-vars is loaded, which in turn will cause errors later.
            ;; Thanks to Tom Breton for this subtlety.
            (let* ((the-version "1.15")
                   (pkg-buffer (funcall download (concat my-archive-base
                                                         "url-" the-version ".tar"))))
              (save-excursion
                (set-buffer pkg-buffer)
                (package-unpack 'url the-version)
                (kill-buffer pkg-buffer))))

          ;; Start the package manager.
          (package-initialize)
          ))))

(when (load (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize)

  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/")))
