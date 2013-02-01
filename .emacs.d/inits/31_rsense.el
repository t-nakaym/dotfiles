;;; for rsense.el

; (package-install 'rsense)
(setq rsense-home (expand-file-name "~/local/rsense-0.3"))
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

; "C-c ." で補完を開始
(add-hook 'ruby-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c .") 'ac-complete-rsense)))

; "." や "::" の入力直後に補完を開始 
(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))
