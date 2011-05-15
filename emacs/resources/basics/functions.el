;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs lisp functions ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun c-header-ifndef ()
  (interactive)
  (let ((fname  (upcase (file-relative-name (buffer-file-name) nil))))
    (when fname
      (while (string-match "\\." fname)
	(setq fname (replace-match "_" nil nil fname)))
      (while (string-match "-" fname)
	(setq fname (replace-match "_" nil nil fname)))
      (insert (concat "#ifndef " fname "_\n"))
      (insert (concat "# define " fname "_\n\n"))
      (insert (concat "#endif // !" fname "_\n")))))

(defun show-man ()
  (interactive)
  (manual-entry (current-word)))

(defun yic-ignore (str)
  (or
   (string-match "\\*Buffer List\\*" str)
   (string-match "\\*scratch\\*" str)
   (string-match "^TAGS" str)
   (string-match "^\\*Messages\\*$" str)
   (string-match "^\\*Completions\\*$" str)
   (string-match "^ " str)
   (memq str
         (mapcar
          (lambda (x)
            (buffer-name
             (window-buffer
              (frame-selected-window x))))
          (visible-frame-list)))
   ))

(defun yic-next (ls)
  (let* ((ptr ls)
	 bf bn go
	 )
    (while (and ptr (null go))
      (setq bf (car ptr)  bn (buffer-name bf))
      (if (null (yic-ignore bn))
	  (setq go bf)
	(setq ptr (cdr ptr))
	)
      )
    (if go
	(switch-to-buffer go))
    )
  )

(defun yic-prev-buffer ()
  (interactive)
  (yic-next (reverse (buffer-list))))

(defun yic-next-buffer ()
  (interactive)
  (bury-buffer (current-buffer))
  (yic-next (buffer-list)))

(defun reload-configuration ()
  (interactive())
  (load-file "~/.emacs"))

(defun reindent-file ()
  "Reindent the current buffer."
  (interactive())
  (if (buffer-file-name)
      (progn
        (reindent (buffer-file-name))
        (message (concat (buffer-file-name) " reindented")))
    )
  )

(defun reindent (file)
  (setq buf (get-file-buffer file))
  (if buf
      (save-excursion
        (set-buffer buf)
        (indent-region (point-min) (point-max) nil)
	)
    )
  (if (not buf)
      (progn
        (setq thehooks find-file-hooks)
        (setq find-file-hooks (list))
        (find-file file)
        (c-mode)
        (indent-region (point-min) (point-max) nil)
        (save-buffer)
        (kill-buffer nil)
        (setq find-file-hooks thehooks)
        )
    )
  )

(defun astyle ()
  (interactive())
  (astyle-region (point-min) (point-max))
  )

(defun astyle-region (pmin pmax)
  (interactive())
  (save-excursion
    (shell-command-on-region pmin pmax
                             "astyle"
                             (current-buffer) t
                             (get-buffer-create "*Astyle Errors*") t)
    (indent-region pmin pmax nil)
    (delete-trailing-whitespace)
    (message "Buffer has been astyled.")))

(defun xmllint ()
  (interactive())
  (xmllint-region (point-min) (point-max))
  )

(defun xmllint-region (pmin pmax)
  (interactive())
  (save-excursion
    (shell-command-on-region pmin pmax
                             "xmllint --format --recover -"
                             (current-buffer) t
                             (get-buffer-create "*Xmllint Errors*") t)
    (message "Buffer has been xmllint-ed.")))

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\|XXX\\):"
          1 font-lock-warning-face t))))
