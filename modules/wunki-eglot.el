;;; -*- lexical-binding: t -*-
;;; wunki-eglot.el --- Language Server Protocol support.

(use-package eglot
  :commands eglot
  :config
  (add-to-list 'eglot-server-programs `(elixir-mode . ("sh" ,(expand-file-name "~/.local/share/elixir-ls/release/language_server.sh"))))
  :hook (elixir-mode . eglot-ensure))

(use-package eldoc-box)

(provide 'wunki-eglot)
