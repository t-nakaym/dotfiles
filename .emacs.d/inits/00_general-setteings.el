;;; general settings

; display settings
(load-theme 'tango-dark)

; encoding settings
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

; save command history
(savehist-mode 1)
(setq history-length 1000)

; show corresponding parenthesis
(show-paren-mode 1)

; set "C-h" to backspace
(global-set-key (kbd "C-h") 'delete-backward-char)

; set "M-g" to goto-line
(global-set-key (kbd "M-g") 'goto-line)

; mode-line settings
(setq display-time-24hr-format t)
(display-time)
(line-number-mode 1)
(column-number-mode 1)

; print key strokes at the mini-buffer quickly
(setq echo-keystrokes 0.1)

; set 'y' is alias of "yes"
(defalias 'yes-or-no-p 'y-or-n-p)

;;; for uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

; suppress a warning: 'mapcar' called for effect
(setq byte-compile-warnings '(free-vars unresolved callargs redefine obsolete noruntime cl-functions interactive-only make-local))

; for emacsclient
(server-start)
