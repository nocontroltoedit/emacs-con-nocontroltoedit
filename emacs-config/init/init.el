(setq NCTE-INIT-DIR (file-name-directory (or load-file-name
					  buffer-file-name)))
(add-to-list 'load-path NCTE-INIT-DIR)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu-devel" . "https://elpa.gnu.org/devel/") t)
;; (package-refresh-contents)
(setq use-package-always-ensure t)
(package-initialize)

(use-package init-general
  :ensure nil)

(use-package init-evil
  :ensure nil)

(use-package recentf
  :config
  (recentf-mode 1))

(use-package magit)

(use-package init-org-publish
  :ensure nil)

(use-package yasnippet
  :config
  (yas-global-mode 1))	

(use-package init-corfu-stack
  :ensure nil)

(use-package init-utils
  :ensure nil)

(use-package org-present
  :config
  (defun my-org-present (&rest args)
    (let ((buf (get-buffer (car args))))
      (with-current-buffer buf
    (setq header-line-format "  org-capture")
    (setq mode-line-format "")
  (setq org-present-text-scale 1.3)
  (setq org-present-hide-stars-in-headings t)
  (setq org-hide-leading-stars t)
  (set-face-attribute 'header-line
		      nil
		    :background nil
		    :weight 'bold
		    :height 500)
  (set-face-attribute 'mode-line
		      nil
		    :background nil
		    :weight 'bold
		    :height 200)
  
  ;; M-x set-fringe-style 'no-fringes
  (set-window-margins nil 5 5)
  (save-excursion
    (goto-char (point-min))
   ;; (delete-blank-lines)
  (newline 2)
  (goto-char (point-max))
  ;; (delete-blank-lines)
  (newline))
  ;; theme wombat
  ;; (org-hide-all-stars-ncte)
;;   (font-lock-add-keywords
;;              nil
;;              '(("^[[:space:]]*#\\+.*$" . 'org-src-meta-face)))
;; ;;  (set-face-attribute 'org-block-begin-line nil :foreground "#000000")
;; (set-face-attribute 'org-block-end-line nil :foreground "#000000")
 ;; (set-face-attribute 'org-block nil :background "#222222")
 ;; (set-face-attribute 'org-block nil :background nil)
  ;; (font-lock-add-keywords
  ;;    nil
  ;;    '(("^[*]+[[:space:]]" . 'org-src-meta-face)))
  ;; (font-lock-fontify-buffer)
)))
  
  (add-to-list 'org-present-after-navigate-functions #'my-org-present)
  )

 (set-face-attribute 'org-meta-line nil
 		    :foreground "black"
 		    :background nil
 		    :height 1
 		    :slant 'normal)

(set-face-attribute 'org-meta-line nil
 		    :foreground "grey"
 		    :background nil
 		    :height 200
 		    :slant 'normal)

;; Define a custom face to hide the metadata of source code blocks
;; (defface org-src-meta-face
;;   '((t (:foreground "background")))  Set the text color to background color (invisible)
;;   "Face to hide Org source block metadata.")

;; Apply the custom face to hide metadata in source code blocks
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (font-lock-add-keywords
;;              nil
;;              '(("^[[:space:]]*#\\+.*$" . 'org-src-meta-face)))))
  
(load-file "~/wd-x1/emacs-con-nocontroltoedit-secret/init/init.el")
