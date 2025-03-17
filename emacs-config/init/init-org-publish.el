(use-package ox-publish)
(use-package htmlize)

(setq ncte-website-header "
  <div id=\"site-header\">
   <h1>no-control-to-edit</h1>
   <div id=\"title-desc\">Practicando español: Emacs, mi editor favorito</div>
<nav class=\"navbar\">
<div class=\"navbar-container\">
   <ul class=\"navbar-links\">
   <li><a href=\"./index.html\" class=\"navbar-link\">Home</a>
   <li><a href=\"./about.html\" class=\"navbar-link\">About</a>
   </ul>b
   </div>
</div>
</nav>
")

(setq ncte-head-extra
      "<link rel=\"stylesheet\" type=\"text/css\" href=\"./css/stylesheet.css\" /> 
<meta http-equiv=\"cache-control\" content=\"max-age=0, no-store, no-cache, must-revalidate, proxy-revalidate\" />
<meta http-equiv=\"expires\" content=\"0\" />
<meta http-equiv=\"pragma\" content=\"no-cache\" />
")

(defun ncte-get-modification-time (file) 
  ""   
  (file-attribute-modification-time
   (file-attributes file)))

(defun nocontroltoedit-github-footer (info)
  (let ((modification-time (ncte-get-modification-time (plist-get info :input-file))))
    
    (format
     "<div id=\"modified-at\" class=\"content\">
updated on
<span class=\"file_modified_date\">%s</span>
at
<span class=\"file_modified_time\">%s</span>
.
</div>" 
     (format-time-string "%d %m %Y" modification-time)
     (format-time-string "%H:%M:%S" modification-time))))

(setq org-publish-project-alist nil)
(add-to-list 'org-publish-project-alist
	     `("nocontroltoedit-github-site"
	       :base-directory "~/wd-x1/emacs-con-nocontroltoedit/docs/org"
	       :publishing-directory "~/wd-x1/emacs-con-nocontroltoedit/docs"
       	       :publishing-function org-html-publish-to-html
	       :headline-numbering nil
	       :section-numbers nil
	       :html-preamble ,ncte-website-header	       
               :html-postamble nocontroltoedit-github-footer
	       :recursive t
	       :html-head-extra ,ncte-head-extra
	       :with-toc nil
	       ))			;

(setq org-export-preserve-breaks t)

(defun org-publish-ncte () 
  (interactive)
  (let ((default-directory "~/wd-x1/emacs-con-nocontroltoedit/emacs-config/init"))
    (save-some-buffers)
    (org-publish-all t)
    (magit)))
