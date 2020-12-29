;;; -*- lexical-binding: t -*-
;;; wunki-term.el -- Terminal settings

(use-package vterm
  :ensure t
  :config
  (setq vterm-shell "/usr/bin/fish"))

;; easily switch to the terminal and back
(use-package vterm-toggle
  :requires vterm
  :commands (vterm-toggle vterm-toggle-cd)
  :bind ("C-c C-s" . 'vterm-toggle))


(provide 'wunki-term)
