;;; 40_emacs-lisp-mode.el ---

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)))
