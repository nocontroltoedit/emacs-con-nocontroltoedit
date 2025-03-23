;; https://github.com/underside/emacs-init/blob/master/init-evil.el 

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; anotations in completing-read
;; marinalia-cycle, minibuffer-local-map
(use-package marginalia
  :config 
  (marginalia-mode))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

;; consult-ripgrep - jump to line in files
;; consult-line - jump to line in buffer
;; consult-line-multi - jump to line in buffers
(use-package consult)

  ;; Popup selector at cursor
;; corfu-exluded-modes
(use-package corfu
  :custom
  (corfu-cycle t)                ;; corfu-next loops to first
  (corfu-auto t)                 ;; auto completion
  (corfu-separator ?\s)          ;; Orderless field separator
  (corfu-quit-at-boundary nil)  
  (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  (corfu-preview-current nil)    ;; no current candidate preview
  (corfu-preselect-first nil)    ;; no candidate preselection
  (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  (corfu-echo-documentation nil) ;; No documentation in echo area
  (corfu-scroll-margin 5)        ;; Add scroll margin
  :init
  (global-corfu-mode))

;; show multpile options, vertically in minibuffer
(use-package vertico
  :init
  (vertico-mode 1)

  (setq vertico-scroll-margin 0)

  ;; Show N candidates
  (setq vertico-count 10)

  ;; Grow/shrink Vertico minibuffer
  (setq vertico-resize t)

  ;; `vertico-next' cycles to first
  (setq vertico-cycle t))


;; Emacs minibuffer configurations.
(use-package emacs
  :custom
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  (read-extended-command-predicate #'command-completion-default-include-p)
  ;; Do not allow the cursor in the minibuffer prompt
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))

(use-package embark
  :bind
  (:map leader-1-keymap
	("." . embark-act)        
	("b" . embark-dwim)      ;; M-.
	("m" . embark-bindings)) ;; alternative for `describe-bindings'
  :init

  (setq embark-help-key "\\")
  (setq embark-cycle-key ".")
  
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  ;; Show the Embark target at point via Eldoc. You may adjust the
  ;; Eldoc strategy, if you want to see the documentation from
  ;; multiple providers. Beware that using this can be a little
  ;; jarring since the message shown in the minibuffer can be more
  ;; than one line, causing the modeline to move up and down:

  ;; (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
  ;; (setq eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none))))) 

(provide 'init-corfu-stack)
