;;; -*- lexical-binding: t -*-
;;; wunki-lsp.el --- Language Server Protocol support.

(use-package lsp-mode
  :ensure
  :commands lsp
  :init
  (add-to-list 'exec-path "~/.local/share/elixir-ls/release")
  :custom
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (add-to-list 'lsp-language-id-configuration '(zig-mode . "zig"))
  (setq lsp-headerline-breadcrumb-enable nil)
  (lsp-register-client (make-lsp-client
                        :new-connection (lsp-stdio-connection "~/code/zls/zig-cache/bin/zls")
                        :major-modes '(zig-mode)
                        :server-id 'zls))
  :hook (elixir-mode . lsp))

(use-package lsp-ui
  :ensure
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show nil)
  (lsp-ui-sideline-show-hover nil)
  (lsp-ui-doc-enable nil))

(provide 'wunki-lsp)
