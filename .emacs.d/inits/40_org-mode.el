;;; 40_org-mode.el --- settings for org-mode

(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c c") 'org-capture)
(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c b") 'org-iswitchb)

(setq org-agenda-files '("~/todo.org"))

(setq org-plantuml-jar-path "~/local/jar/plantuml.jar")
(add-hook 'org-mode-hook
	  (lambda ()
	    (org-babel-do-load-languages
	     'org-babel-load-languages
	     (add-to-list 'org-babel-load-languages '(plantuml . t)))))
