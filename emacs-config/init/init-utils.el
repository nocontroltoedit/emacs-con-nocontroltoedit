(defun emulate-key-press-C-c-C-c-ncte ()
 (interactive)
  (call-interactively (key-binding (kbd "C-c C-c"))))

(defun emulate-key-press-C-c-C-k-ncte ()
  (interactive)
  (call-interactively (key-binding (kbd "C-c C-k"))))

(defun emulate-key-press-C-c-C-q-ncte ()
  (interactive)
  (call-interactively (key-binding (kbd "C-c C-q"))))

(provide 'init-utils)
