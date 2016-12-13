;;; 40_org-mode.el --- settings for org-mode

(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c c") 'org-capture)
(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c b") 'org-iswitchb)

(setq org-agenda-files '("~/org-files/todo.org" "~/org-files/schedule.org"))
(setq org-capture-templates
      '(("t" "Task" entry (file "~/org-files/todo.org")
             "* TODO %?\n")
        ("s" "Schedule" entry (file "~/org-files/schedule.org")
             "* TODO %?\n")))

(add-hook 'org-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)))

(setq org-plantuml-jar-path "~/local/jar/plantuml.jar")
(add-hook 'org-mode-hook
          (lambda ()
            (org-babel-do-load-languages
             'org-babel-load-languages
             (add-to-list 'org-babel-load-languages '(plantuml . t)))))
