;;; 31_migemo.el --- settings for migemo

(when (and (executable-find "cmigemo")
           (require 'migemo nil t))
  (setq migemo-command "cmigemo")
  (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
  (setq migemo-options '("-q" "--emacs"))

  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  (migemo-init)
)
