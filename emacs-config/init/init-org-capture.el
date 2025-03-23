(use-package org-capture
  :ensure nil
  :config
  
  (setq org-capture-templates 
	       '(("e"
		 "Yak-Shaving en emacs"
		 entry
		 (file "~/wd-x1/emacs-con-nocontroltoedit/docs/org/emacs-yak-shaving.org")
		 "* %?\n %i\n"
		 :prepend t
		 :created t)
	       ("t"
		 "Para Hacer"
		 entry
		 (file "~/wd-x1/emacs-con-nocontroltoedit/docs/org/todo.org")
		 "* %?\n %i\n"
		 :prepend t
		 :create t))))

(defun org-capture-buffer-setup-ntce ()
  (setq header-line-format ""))

(add-hook 'org-capture-mode-hook #'org-capture-buffer-setup-ntce)

  (defun org-capture-completing-read-ncte ()
    "Use completing read to choose capture"
    (interactive)
  (when-let* ((candidates (mapcar (lambda (e)
				    "list of (labels . org-capture-key)"	  
				    (cons
				     (format "%-3s %s"
					     (nth 0 e)
					     (nth 1 e))
				     (nth 0 e)))
			  org-capture-templates))
	      (chosen (completing-read "Org Capture: " candidates))
	      (chosen-key (assoc-default chosen candidates)))
    (org-capture nil chosen-key)))

(defun org-capture-e-ncte ()
    (interactive)
    (org-capture nil "e"))

(defun org-capture-t-ncte ()
    (interactive)
    (org-capture nil "t"))

