DIR=~/emacsd/emacs-con-nocontroltoedit
echo '(load-file "~/wd-x1/emacs-con-nocontroltoedit/emacs-config/init/init.el")' > $DIR/init.el
emacs --init-directory $DIR 

