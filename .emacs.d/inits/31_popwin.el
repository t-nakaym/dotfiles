;;; 31_popwin.el --- Settings for popwin.el

;; Copyright (C) 2013  Takashi Nakayama

;; Author: Takashi Nakayama <tnakaym@gmail.com>

(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

; for anything.el
(setq anything-samewindow nil)
(push '(" *my-anything*" :height 20) popwin:special-display-config)
