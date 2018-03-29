;;; -*- lexical-binding: t -*-
;;; wunki-editing.el --- Configure your editing style.

(require 'wunki-lib)

(use-package expand-region
  :commands er/expand-region
  :bind ("C-c e" . er/expand-region))

;; Keybindings
;; Remap join-line to M-j where it's easier to get to.
(global-set-key (kbd "M-j") 'join-line)

;; Kill region, or when nothing selected, the word.
(global-set-key (kbd "C-w") 'wunki/kill-region-or-backward-word)

;; Hit C-c <tab> to auto-indent the entire buffer you're in.
(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))
(global-set-key (kbd "C-c <tab>") 'indent-buffer)

;; Automatically insert matching braces and do other clever
;; things pertaining to braces and such.
(electric-pair-mode 1)

(provide 'wunki-editing)
