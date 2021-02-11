;;; -*- lexical-binding: t -*-
;;; wunki-lsp.el --- Language Server Protocol support.

(use-package lsp-mode
  :ensure
  :commands lsp
  :custom
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (add-to-list 'lsp-language-id-configuration '(zig-mode . "zig"))
  (lsp-register-client (make-lsp-client
                        :new-connection (lsp-stdio-connection "~/code/zls/zig-cache/bin/zls")
                        :major-modes '(zig-mode)
                        :server-id 'zls)))

(use-package lsp-ui
  :ensure
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil))

(provide 'wunki-lsp)
