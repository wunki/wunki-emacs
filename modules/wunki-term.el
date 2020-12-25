;;; -*- lexical-binding: t -*-
;;; wunki-term.el -- Terminal settings

(use-package vterm
  :ensure t
  :config
  (setq vterm-shell "/usr/bin/fish"))

(provide 'wunki-term)
