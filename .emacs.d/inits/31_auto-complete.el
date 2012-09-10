;;; for auto-complete.el

; download from http://cx4a.org/software/auto-complete/index.ja.html
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete-1.3.1/dict")
(ac-config-default)
