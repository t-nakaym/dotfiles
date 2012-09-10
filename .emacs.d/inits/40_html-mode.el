;;; 40_html-mode.el --- for html-mode

(add-hook 'html-mode-hook
	  (lambda ()
	    (setq sgml-basic-offset 2)
            (setq indent-tabs-mode nil)))
