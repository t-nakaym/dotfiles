;;; 31_helm.el ---

(require 'helm-config)

(global-set-key (kbd "M-;") 'helm-mini)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
