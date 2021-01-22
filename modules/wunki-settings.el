;;; -*- lexical-binding: t -*-
;;; wunki-settings.el --- Setting up the basics.

;; Make sure we always use UTF-8.
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(load-library "iso-transl")

;; don't show splash screen
(setq inhibit-splash-screen t)

;; don't show anything as the scratch message
(setq initial-scratch-message "")

;; don't ring any bells
(setq ring-bell-function 'ignore)

;; Always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; Emacs writes backup files to `filename~` by default. This is messy,
;; so let's tell it to write them to `~/.emacs.d/bak` instead.
;; If you have an accident, check this directory - you might get lucky.
(setq backup-directory-alist
      `(("." . ,(expand-file-name (concat dotfiles-dir "bak")))))

;; Automatically save buffers before launching M-x compile and friends,
;; instead of asking you if you want to save.
(setq compilation-ask-about-save nil)

;; Always follow symlinks without asking me
(setq vc-follow-symlinks t)

;; Make the selection work like most people expect.
(delete-selection-mode t)
(transient-mark-mode t)

;; Automatically update unmodified buffers whose files have changed.
(global-auto-revert-mode 1)

;; If available, enable font ligatures (only available on emacs-mac build)
(when (fboundp 'mac-auto-operator-composition-mode)
  (mac-auto-operator-composition-mode t))

;; If available, use `xdg-open' to open URLs.
(when (wunki/is-exec "xdg-open")
  (setq-default
   browse-url-browser-function (quote browse-url-generic)
   browse-url-generic-program "xdg-open"))

;; Make compilation buffers scroll to follow the output, but stop scrolling
;; at the first error.
(setq compilation-scroll-output 'first-error)

;; use mac key as meta
(setq mac-command-modifier 'meta)

;; aspell for spell-checking
(setq ispell-program-name "aspell")

(provide 'wunki-settings)
