;;; 31_helm.el ---

(require 'helm-config)
(helm-mode 1)

(defun my-helm ()
  (interactive)
  (require 'helm-files)
  (let ((helm-ff-transformer-show-only-basename nil))
    (helm-other-buffer
     '(helm-source-buffers-list
       helm-source-recentf
       helm-source-buffer-not-found
       helm-source-files-in-current-dir
       helm-source-file-name-history)
     "*my helm*")))
(global-set-key (kbd "M-;") 'my-helm)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(define-key helm-map (kbd "C-h") 'helm-ff-delete-char-backward)
