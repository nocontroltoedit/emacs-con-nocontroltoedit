(use-package evil
  :config
  (evil-mode 1)
  
  (setq evil-normal-state-cursor '("orange" box))
  (setq evil-visual-state-cursor '("orange" box))
  (setq evil-insert-state-cursor '("green" bar))
  (setq evil-replace-state-cursor '("green" bar))
  (setq evil-operator-state-cursor '("red" hollow)))


(defun evil-nerd-commenter-key-bindings-ncte ()
    (define-key evil-normal-state-map ",ci" 'evilnc-comment-or-uncomment-lines)
    (define-key evil-visual-state-map ",ci" 'evilnc-comment-or-uncomment-lines)
    (define-key evil-normal-state-map ",cl" 'evilnc-quick-comment-or-uncomment-to-the-line)
    (define-key evil-normal-state-map ",ll" 'evilnc-quick-comment-or-uncomment-to-the-line)
    (define-key evil-normal-state-map ",cc" 'evilnc-copy-and-comment-lines)
    (define-key evil-visual-state-map ",cc" 'evilnc-copy-and-comment-lines)
    (define-key evil-normal-state-map ",cp" 'evilnc-comment-or-uncomment-paragraphs)
    (define-key evil-normal-state-map ",cs" 'evilnc-comment-box)
    (define-key evil-visual-state-map ",cs" 'evilnc-comment-box)
    (define-key evil-normal-state-map ",cr" 'comment-or-uncomment-region)
    (define-key evil-normal-state-map ",cv" 'evilnc-toggle-invert-comment-line-by-line)

    ;; comment itself is text object
    (define-key evil-inner-text-objects-map evilnc-comment-text-object 'evilnc-inner-commenter)
    (define-key evil-outer-text-objects-map evilnc-comment-text-object 'evilnc-outer-commenter)

    (when evilnc-use-comment-object-setup
      ;; Install operator for evil text objects
      (define-key evil-normal-state-map ",." 'evilnc-copy-and-comment-operator)
      (define-key evil-visual-state-map ",." 'evilnc-copy-and-comment-operator)
      (define-key evil-normal-state-map ",," 'evilnc-comment-operator)
      (define-key evil-visual-state-map ",," 'evilnc-comment-operator)))


(use-package evil-nerd-commenter
  :after evil
  :commands (evilnc-comment-operator
             evilnc-inner-comment
             evilnc-outer-commenter)
  :config
  (evil-nerd-commenter-key-bindings-ncte))



(use-package init-evil-textobjects
  :ensure nil)

(provide 'init-evil)

