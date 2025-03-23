(defvar org-all-stars-re "^\\*+[\t ]"
  "Regex used to recognize all stars in org-headings.")

(defun org-hide-all-stars-ncte (&optional visibile-p)
  "Update invisible property to VISIBILE-P for markers in the current buffer."
  (org-with-wide-buffer
   (save-excursion
     (goto-char (point-min))
     (with-silent-modifications
       (while (re-search-forward org-all-stars-re nil t)
         (put-text-property
          (match-beginning 0) (match-end 0) 'invisible (not visibile-p)))))))



;; ;;;###autoload
;; (define-minor-mode org-hide-leading-stars-mode
;;   "Hide/show babel source code blocks on demand."
;;   :global nil :lighter " Org-hls"
;;   (unless (derived-mode-p 'org-mode)
;;     (error "Not in org-mode"))
;;   (cond (org-hide-leading-stars-mode
;;          (org-hide-leading-stars--update-headings t))
;;         (t (org-hide-leading-stars--update-headings nil))))

;; (provide 'org-hide-leading-stars)
