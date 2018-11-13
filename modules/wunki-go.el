;;; -*- lexical-binding: t -*-
;;; wunki-go.el --- Simplicity taken to its extreme

(provide 'wunki-go)

(use-package go-mode
  :commands go-mode
  :config
  ;; use goimports for formatting and fixing imports
  (setq gofmt-command "goimports")
  :hook ((before-save . gofmt-before-save)
         (go-mode . company-mode)))

(use-package company-go
  :after go-mode)

(use-package go-eldoc
  :commands go-eldoc-setup
  :hook (go-mode . go-eldoc-setup))

(use-package flycheck-gometalinter
  :config
  (progn
    (flycheck-gometalinter-setup))
    ;; skip linting for vendor dirs
    (setq flycheck-gometalinter-vendor t)
    ;; use in test files
    (setq flycheck-gometalinter-test t)
    ;; only use fast linters
    (setq flycheck-gometalinter-fast t)
    ;; explicitly disable 'gotype' linter
    (setq flycheck-gometalinter-disable-linters '("gotype")))

;;; wunki-go.el ends here
