;;; -*- lexical-binding: t -*-
;;; wunki-lsp.el --- Language Server Protocol support.

;; Basic lsp-mode config.
;; Language modules will add their own lsp setup if this is loaded.
(use-package lsp-mode
  :commands lsp
  :hook ((before-save . lsp-format-buffer)
         (before-save . lsp-organize-imports))
  :config
  (setq lsp-completion-provider :capf)
  (add-to-list 'lsp-language-id-configuration '(zig-mode . "zig"))
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection "/Users/petar/Code/zls/zig-cache/bin/zls")
    :major-modes '(zig-mode)
    :server-id 'zls))
  :diminish lsp-mode)

(use-package lsp-ui
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode))

(provide 'wunki-lsp)
