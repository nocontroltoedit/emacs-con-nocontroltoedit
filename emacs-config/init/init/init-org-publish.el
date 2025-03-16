(use-package ox-publish)


;; (:export-options :back-end :translate-alist :exported-data
;; 		 :input-buffer :input-file :html-doctype
;; 		 :html-container :html-content-class :description
;; 		 :keywords :html-html5-fancy :html-link-use-abs-url
;; 		 :html-link-home :html-link-up :html-mathjax
;; 		 :html-equation-reference-format :html-postamble
;; 		 :html-preamble :html-head :html-head-extra :subtitle
;; 		 :html-head-include-default-style
;; 		 :html-head-include-scripts
;; 		 :html-allow-name-attribute-in-anchors :html-divs
;; 		 :html-checkbox-type :html-extension
;; 		 :html-footnote-format :html-footnote-separator
;; 		 :html-footnotes-section :html-format-drawer-function
;; 		 :html-format-headline-function
;; 		 :html-format-inlinetask-function :html-home/up-format
;; 		 :html-indent :html-infojs-options
;; 		 :html-infojs-template :html-inline-image-rules
;; 		 :html-link-org-files-as-html :html-mathjax-options
;; 		 :html-mathjax-template
;; 		 :html-metadata-timestamp-format
;; 		 :html-postamble-format :html-preamble-format
;; 		 :html-prefer-user-labels :html-self-link-headlines
;; 		 :html-table-align-individual-fields
;; 		 :html-table-caption-above :html-table-data-tags
;; 		 :html-table-header-tags
;; 		 :html-table-use-header-tags-for-first-column
;; 		 :html-tag-class-prefix :html-text-markup-alist
;; 		 :html-todo-kwd-class-prefix :html-toplevel-hlevel
;; 		 :html-use-infojs :html-validation-link :html-viewport
;; 		 :html-inline-images :html-table-attributes
;; 		 :html-table-row-open-tag :html-table-row-close-tag
;; 		 :html-xml-declaration :html-wrap-src-lines
;; 		 :html-klipsify-src :html-klipse-css :html-klipse-js
;; 		 :html-klipse-selection-script :infojs-opt :creator
;; 		 :with-latex :latex-header :title :date :author :email
;; 		 :language :select-tags :exclude-tags :headline-levels
;; 		 :preserve-breaks :section-numbers :time-stamp-file
;; 		 :with-archived-trees :with-author :expand-links
;; 		 :with-broken-links :with-clocks :with-creator
;; 		 :with-date :with-drawers :with-email :with-emphasize
;; 		 :with-entities :with-fixed-width :with-footnotes
;; 		 :with-inlinetasks :with-planning :with-priority
;; 		 :with-properties :with-smart-quotes
;; 		 :with-special-strings :with-special-rows
;; 		 :with-statistics-cookies :with-sub-superscript
;; 		 :with-toc :with-tables :with-tags :with-tasks
;; 		 :with-timestamps :with-title :with-todo-keywords
;; 		 :with-cite-processors :cite-export :output-file
;; 		 :base-directory :publishing-directory
;; 		 :publishing-function :recursive :crossrefs
;; 		 :filter-final-output :bibliography :filter-body
;; 		 :filter-bold :filter-babel-call :filter-center-block
;; 		 :filter-clock :filter-code :filter-diary-sexp
;; 		 :filter-drawer :filter-dynamic-block :filter-entity
;; 		 :filter-example-block :filter-export-block
;; 		 :filter-export-snippet :filter-fixed-width
;; 		 :filter-footnote-definition
;; 		 :filter-footnote-reference :filter-headline
;; 		 :filter-horizontal-rule :filter-inline-babel-call
;; 		 :filter-inline-src-block :filter-inlinetask
;; 		 :filter-italic :filter-item :filter-keyword
;; 		 :filter-latex-environment :filter-latex-fragment
;; 		 :filter-line-break :filter-link :filter-node-property
;; 		 :filter-options :filter-paragraph :filter-parse-tree
;; 		 :filter-plain-list :filter-plain-text
;; 		 :filter-planning :filter-property-drawer
;; 		 :filter-quote-block :filter-radio-target
;; 		 :filter-section :filter-special-block
;; 		 :filter-src-block :filter-statistics-cookie
;; 		 :filter-strike-through :filter-subscript
;; 		 :filter-superscript :filter-table :filter-table-cell
;; 		 :filter-table-row :filter-target :filter-timestamp
;; 		 :filter-underline :filter-verbatim
;; 		 :filter-verse-block :ignore-list :parse-tree
;; 		 :headline-offset :headline-numbering :id-alist
;; 		 :citations :internal-references)

(setq ncte-html-head
      "
<meta http-equiv=\"cache-control\" content=\"max-age=0\" />
<meta http-equiv=\"cache-control\" content=\"no-cache\" />
<meta http-equiv=\"expires\" content=\"0\" />
<meta http-equiv=\"expires\" content=\"Tue, 01 Jan 1980 1:00:00 GMT\" />
<meta http-equiv=\"pragma\" content=\"no-cache\" />
")

(defun ncte-get-modification-time (file) 
  ""   
 (file-attribute-modification-time
		      (file-attributes file)))

(defun nocontroltoedit-github-footer (info)
  (let ((modification-time (ncte-get-modification-time (plist-get info :input-file))))
	
	(format
	 "<div id=\"modified_at\" class=\"content\">
last updated on
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
       			:html-postamble nocontroltoedit-github-footer
			:headline-numbering nil
			:section-numbers nil
			:html-head ,ncte-html-head
			:recursive t
			:with-toc nil
			))


	 ;; :html-postamble  "<div idfooter><p>last modified: %C</p></footer>"
	 ;; :with-author nil
	 ;; :with-creator nil
	 ;; :time-stamp-file nil
	 (save-buffer)
	 (org-publish-all t)
	 (magit)
