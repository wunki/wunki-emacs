;;; -*- lexical-binding: t -*-
;;; wunki-term.el -- Terminal settings

(use-package vterm
  :ensure t
  :config
  (setq vterm-shell (if (wunki/is-mac)
                        "/usr/local/bin/fish"
                        "/usr/bin/fish")))

;; easily switch to the terminal and back
(use-package vterm-toggle
  :requires vterm
  :commands (vterm-toggle vterm-toggle-cd)
  :bind ("C-c C-<return>" . 'vterm-toggle-cd))

(provide 'wunki-term)
