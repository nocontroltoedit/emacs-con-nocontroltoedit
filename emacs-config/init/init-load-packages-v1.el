;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu-devel" . "https://elpa.gnu.org/devel/") t)
;; (package-refresh-contents)

;; Run this and reload buffer to install missing packages
;; (setq use-package-always-ensure t)

;; Insert pre-written text with customizable sections
(use-package yasnippet
  :config
  (yas-global-mode 1))

;; GUI for using GIT version control
(use-package magit)

(use-package consult)
	
;; completion on region function
;; https://kristofferbalintona.me/posts/202202270056/
(use-package corfu
  :config
  (global-corfu-mode))

  ;; corfu-map
  ;;           "n" #'corfu-next
  ;;           "p" #'corfu-previous
  ;;           "q" #'corfu-quit
  ;;           "i" #'corfu-insert
  ;;           "d" #'corfu-show-documentation
  ;;           "l" #'corfu-show-location)


(use-package marginalia
  :custom
  (marginalia-max-relative-age 0)
  (marginalia-align 'right)
  :init
  (marginalia-mode))

  ;; minibuffer-local-map
  ;;           "M-A" 'marginalia-cycle)


;; (all-the-icons-install-fonts)
(use-package all-the-icons
  :if (display-graphic-p))

(use-package all-the-icons-completion
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init
  (all-the-icons-completion-mode))

(use-package completion
  :config
  (setq completion-styles '(orderless basic)) 
  (setq completion-ignore-case t)
  ;; (setq completion-category-overrides nil)
  ;; I want to be in control!  
  ;; (setq completion-category-defaults nil)
  (completion-preview-mode -1)
  (setq completion-preview-minimum-symbol-length 1)
 ;; (setq completions-highlight-face 'completions-highlight)
  ;; (setq completions-header-format (propertize "%s candidates:\n" 'face 'bold-italic))
  
  )



(use-package minibuffer
  :config
  ;; allow space for orderless multi filters
  (define-key minibuffer-local-map (kbd "SPC") nil)
  ;; allow ? for orderless regex
  (define-key minibuffer-local-map (kbd "?") nil)) 
  ;; (setq completion-category-overrides
  ;;  '((file (styles basic-remote ; For `tramp' hostname completion with `vertico'
  ;;                  orderless))
  ;;    (command (styles orderless+initialism))
  ;;    (variable (sytles orderless+initialism))))



;; https://kristofferbalintona.me/posts/202202211546/
(use-package vertico  
  :custom
  (vertico-count 13)  ;; Number of candidates to display
  (vertico-resize t)
  (vertico-cycle nil) ;; Go from last to first 
  :config
  (vertico-mode))

(use-package modus-themes
  :custom
  (modus-themes-completions (quote ((matches . (underline))
                                    (selection . (bold intense))))))

(use-package evil
  :config
  (evil-mode))
