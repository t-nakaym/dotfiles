;;; for yasnippet.el
; (install-elisp-from-emacswiki "yasnippet-config.el")
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet-0.6.1c")
(require 'yasnippet-config)
(yas/setup "~/.emacs.d/plugins/yasnippet-0.6.1c")
(setq yas/root-directory "~/.emacs.d/snippets")
(yas/load-directory yas/root-directory)
