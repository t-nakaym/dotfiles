;;; 50_highlight-indentation-mode.el ---

(require 'highlight-indentation)

(setq highlight-indentation-offset 2)
(set-face-background 'highlight-indentation-current-column-face "LightSlateGray")
(add-hook 'enh-ruby-mode-hook 'highlight-indentation-current-column-mode)
