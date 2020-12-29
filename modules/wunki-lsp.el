;;; -*- lexical-binding: t -*-
;;; wunki-lsp.el --- Language Server Protocol support.

(use-package eglot
  :ensure t
  :commands (eglot eglot-ensure)
  :hook ((elixir-mode . eglot-ensure)
         (rust-mode . eglot-ensure)
         (before-save . eglot-format-buffer))
  :config
  (add-to-list 'eglot-server-programs `(elixir-mode . ("sh" ,(concat projects-dir "/elixir-ls/release/language_server.sh"))))
  (setq eglot-confirm-server-initiated-edits nil))

(provide 'wunki-lsp)
