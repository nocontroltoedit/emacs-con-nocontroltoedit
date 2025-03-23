;; Setup mail to use google
(use-package smtpmail
  :config
  (setq user-mail-address "nocontroltoedit@gmail.com")
  (setq user-full-name "No Control To Edit")
  (setq smtpmail-smtp-server "smtp.gmail.com")
  (setq smtpmail-smtp-service 587)
  (setq smtpmail-stream-type 'starttls)
  ;; Set up a 'Gmail App password
  ;; note: remove spaces from password and don't quote
  ;; https://support.google.com/mail/answer/185833?hl=en-GB
  ;; https://myaccount.google.com/apppasswords
  ;;
  ;; Put details in ~/authinfo as plain text or use ~/authinfo.gpg
  ;; Example entry
  ;;   machine smtp.gmail.com login nocontroltoedit@gmail.com password MyPaSwOrD port 587
  (setq smtpmail-auto-credentials (expand-file-name "~/.authinfo")))

