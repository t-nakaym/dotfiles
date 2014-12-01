;;; go-mode.el ---
; (package-install 'go-mode)
; $ go get -u code.google.com/p/rog-go/exp/cmd/godef
; $ go get -u github.com/nsf/gocode
; $ go get -u github.com/golang/lint/golint

(eval-after-load "go-mode"
  '(progn
     (require 'go-autocomplete)
     (require 'auto-complete-config)

     (add-hook 'go-mode-hook
               (lambda ()
                 (setq tab-width 4)
                 (setq indent-tabs-mode t)
                 (go-eldoc-setup)))

     (add-hook 'before-save-hook 'gofmt-before-save)

     ;; key bindings
     ; tag jump (need "godef" command)
     (define-key go-mode-map (kbd "M-.") 'godef-jump)
     (define-key go-mode-map (kbd "M-,") 'pop-tag-mark)))
