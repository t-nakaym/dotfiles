;;; for whitespace-mode
(require 'whitespace)

(setq whitespace-style '(face tabs tab-mark spaces space-mark newline newline-mark))
(setq whitespace-display-mappings
      '((space-mark   ?\u3000 [?\u25a1])
        (tab-mark     ?\t     [?\xBB ?\t] [?\\ ?\t])))
(setq whitespace-space-regexp "\\(\u3000+\\)")
(set-face-foreground  'whitespace-space "LightSlateGray")
(set-face-background  'whitespace-space 'nil)
(set-face-foreground  'whitespace-tab "LightSlateGray")
(set-face-background  'whitespace-tab 'nil)
(set-face-underline-p 'whitespace-tab t)

(global-whitespace-mode 1)
