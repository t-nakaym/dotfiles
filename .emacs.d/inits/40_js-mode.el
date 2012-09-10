;;; 40_js-mode.el --- for javascript-mode

;; js2-mode: http://code.google.com/p/js2-mode/
(autoload 'js2-mode "js2" nil t)
(setq-default js2-basic-offset 4)

(when (load "js2" t)
  (setq js2-bounce-indent-flag nil)
  (set-face-foreground 'js2-function-param-face (face-foreground font-lock-variable-name-face))
  (defun indent-and-back-to-indentation ()
    (interactive)
    (indent-for-tab-command)
    (let ((point-of-indentation
	   (save-excursion
	     (back-to-indentation)
	     (point))))
      (skip-chars-forward "\s " point-of-indentation)))
  (define-key js2-mode-map (kbd "C-i") 'indent-and-back-to-indentation)
  (define-key js2-mode-map (kbd "C-m") nil)
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode)))

;; replace the indentation function to the espresso-mode's one
(add-hook 'js2-mode-hook
	  #'(lambda ()
	      (require 'js)
	      (setq js-indent-level 4
		    js-expr-indent-offset 4
		    indent-tabs-mode nil)
	      (set (make-local-variable 'indent-line-function) 'js-indent-line)))
