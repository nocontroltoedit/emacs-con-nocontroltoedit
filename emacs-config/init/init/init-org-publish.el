(use-package ox-publish)

(setq nocontroltoedit-github-footer "nocontroltoedit 2025")



(setq org-publish-project-alist nil)
(add-to-list 'org-publish-project-alist
	     `("nocontroltoedit-github-site"
		   :base-directory "~/wd-x1/emacs-con-nocontroltoedit/docs/org"
		   :publishing-directory "~/wd-x1/emacs-con-nocontroltoedit/docs"
       		   :publishing-function org-html-publish-to-html
		   :html-postamble ,nocontroltoedit-github-footer
		   :recursive t
		   :with-author nil
		   :with-toc nil
		   :with-creator nil
		   :time-stamp-file nil))
