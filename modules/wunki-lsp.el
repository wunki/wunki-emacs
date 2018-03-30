;;; -*- lexical-binding: t -*-
;;; wunki-lsp.el --- Language Server Protocol support.

;; Basic lsp-mode config.
;; Language modules will add their own lsp setup if this is loaded.
(use-package lsp-mode)

(with-eval-after-load "company"
  (use-package company-lsp
    :after lsp-mode
    :config
    (push 'company-lsp company-backends)))

(use-package lsp-ui
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode))

(provide 'wunki-lsp)
