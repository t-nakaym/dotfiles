;;; for auto-install.el
; (install-elisp-from-emacswiki "auto-install.el")
(require 'auto-install)
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
