(use-package ox-publish)
(add-to-list 'org-publish-project-alist
	     '("nocontroltoedit-github-site"
		   :base-directory "~/wd-x1/emacs-con-nocontroltoedit/docs/org"
		   :publishing-directory "~/wd-x1/emacs-con-nocontroltoedit/docs"
		   :publishing-function org-html-publish-to-html
		   :recursive t))
