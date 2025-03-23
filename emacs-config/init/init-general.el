;; Put custom setting in own file, instead of .emacs
(setq custom-file (expand-file-name "custom.el" NCTE-INIT-DIR))

;; Load the custom file (so it's always applied)
(load custom-file 'noerror)

(add-to-list 'default-frame-alist '(font . "Monospace-18"))

(menu-bar-mode 1)
(tool-bar-mode -1)

;; Use shorter answers where applicable
;; i.e. y instead of yes
(setq use-short-answers t)  

;; Startup splash screen with help info 
(setq inhibit-splash-screen t)
;; Message in the  minibuffer
(setq inhibit-startup-message t)

;; Remove message at to of *Scratch* buffer
(setq initial-scratch-message "")

;; change inital start buffer
(setq initial-buffer-choice user-emacs-directory)

;; Disable startup message in the minibuffer
;; i.e. For information about GNU Emacs and the GNU system, type C-h C-a.
;; NOTE: value must be your username see M-x describe-variable user-login-name
(setq inhibit-startup-echo-area-message "no-control")

;; Load the theme: wombat, modus-vivendi, leuven, modus-operandi
;; (load-theme 'modus-vivendi t)
(load-theme 'leuven t)
;; (load-theme 'modus-operandi t)

;; Enable GUI cut and paste
(setq select-enable-clipboard t)
(setq select-enable-primary t)

;; Automatically revert files when they change outside Emacs
(global-auto-revert-mode 1)

;; Enable auto-completion (using default built-in completion)
(setq tab-always-indent 'complete)

;; Change where backup files will be stored
(setq backup-directory-alist
      `(("." . ,(expand-file-name "backups" user-emacs-directory))))

;; Automatically switch to the directory of the file you're editing
(setq dired-dwim-target t)

;; Automatically save and restore desktop sessions
(desktop-save-mode 1)

;; Set location for the desktop file
(setq desktop-dirname (expand-file-name "desktop/" user-emacs-directory))
(setq desktop-base-file-name "emacs.desktop")
(setq desktop-base-lock-name "emacs.desktop.lock")


;; Set the font to Fira Code for ligatures and clear distinction
(set-face-attribute 'default nil
		    :font "JetBrains Mono"
		    :weight 'semibold
		    :height 200)

;; (load-file "~/emacs-config-2025/ncte/init/init-load-packages.el")

(provide 'init-general)
