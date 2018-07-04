;;; -*- lexical-binding: t -*-
;;; wunki-editing.el --- Configure your editing style.

(require 'wunki-lib)

(use-package expand-region
  :commands er/expand-region
  :bind ("C-c e" . er/expand-region))

;; In this day and age, we need emoji's
(use-package emojify
  :commands emojify-mode
  :hook
  ((markdown-mode . emojify-mode)
   (twittering-edit-mode . emojify-mode)
   (git-commit-mode . emojify-mode)
   (magit-status-mode . emojify-mode)
   (magit-log-mode . emojify-mode)))

;; Update the buffer when a file changes on disk
(global-auto-revert-mode 1)

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

;; On the mac, use alt as the default meta key
(when (wunki/is-mac)
  (setq mac-option-modifier 'meta))

;; Automatically insert matching braces and do other clever
;; things pertaining to braces and such.
(electric-pair-mode 1)

(provide 'wunki-editing)
