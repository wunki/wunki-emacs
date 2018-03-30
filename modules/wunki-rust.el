;;; -*- lexical-binding: t -*-
;;; wunki-rust.el --- Rust language support.

(use-package rust-mode)

(use-package cargo
  :hook (rust-mode . cargo-minor-mode)
  :config
  (setq compilation-ask-about-save nil)
  ;; Automatically re-run compilation command on manual save inside a project.
  ;; Will do nothing if a compilation hasn't been manually triggered
  ;; in the past.
  (with-eval-after-load "projectile"
    (bind-key "C-c C-s" #'ohai-rust/save-and-recompile)
    (bind-key "C-c s" #'ohai-rust/save-all-and-recompile))
  :diminish cargo-minor-mode)

;; If the LSP module is enabled, set up RLS support.
(with-eval-after-load "wunki-lsp"
  (require 'wunki-flycheck)
  (use-package lsp-rust
    :hook ((rust-mode . lsp-rust-enable)
           (rust-mode . flycheck-mode))))

(defun wunki/save-and-recompile ()
  (interactive)
  (save-buffer)
  (when compile-history
    (let ((cmd (car compile-history)))
      (projectile-run-compilation cmd))))

(defun wunki/save-all-and-recompile ()
  (interactive)
  (save-some-buffers)
  (when compile-history
    (let ((cmd (car compile-history)))
      (projectile-run-compilation cmd))))

(provide 'wunki-rust)
