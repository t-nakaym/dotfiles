(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;;; add melpa adn orgmode for packages

;;; install favarite packages unless they aren't installed
(defvar my-favarite-package-list
  '(auto-async-byte-compile
    browse-kill-ring
    highlight-indentation
    google-c-style
    auto-complete
    helm)
  "packages to be installed")

(dolist (pkg my-favarite-package-list)
  (unless (package-installed-p pkg)
    (package-install pkg)))

;;; load configuration scripts
(let* ((dir "~/.emacs.d/inits")
       (el-suffix "\\.el\\'")
       (files (mapcar
               (lambda (path) (replace-regexp-in-string el-suffix "" path))
               (directory-files dir t el-suffix))))
  (dolist (file files) (load file)))
