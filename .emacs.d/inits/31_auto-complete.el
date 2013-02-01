;;; for auto-complete.el

; (package-install 'auto-complete)
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20130122.1551")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130122.1551/dict")
(ac-config-default)
