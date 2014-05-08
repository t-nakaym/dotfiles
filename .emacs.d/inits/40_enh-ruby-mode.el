;;; 40_enh-ruby-mode.el ---

; (package-install 'enh-ruby-mode)
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

(setq enh-ruby-deep-indent-paren nil)

(add-hook 'enh-ruby-mode-hook
          (lambda ()
             ; Use ruby-mode yasnippets in enh-ruby-mode
             (yas-activate-extra-mode 'ruby-mode)
             ; Enable robe-mode
             (robe-mode)
             (save-excursion
               (window-configuration-to-register 'a)
               (inf-ruby)
               (robe-start)
               (jump-to-register 'a))))

; for robe-mode
(add-hook 'robe-mode-hook 'ac-robe-setup)
