;;; 40_js-mode.el --- for javascript-mode

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook
          '(lambda ()
             (setq js-indent-level 4)
             (setq indent-tabs-mode nil)))
