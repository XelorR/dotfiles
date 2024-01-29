@echo off
emacs -nw -Q --eval '(progn (setq make-backup-files nil) (menu-bar-mode -1))' %*

