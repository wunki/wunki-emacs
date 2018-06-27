;;; -*- lexical-binding: t -*-
;;; wunki-rust.el --- Rust language support.

(use-package rust-mode
  :commands rust-mode
  :init
  (setq rust-format-on-save t))

(use-package cargo
  :hook (rust-mode . cargo-minor-mode)
  :init
  (setq compilation-ask-about-save nil)
  ;; Automatically re-run compilation command on manual save inside a project.
  ;; Will do nothing if a compilation hasn't been manually triggered
  ;; in the past.
  (with-eval-after-load "projectile"
    (bind-key "C-c p c" #'wunki/save-and-recompile)
    (bind-key "C-c p C" #'wunki/save-all-and-recompile))
  :diminish cargo-minor-mode)

;; lsp interaction
(use-package eglot
  :commands eglot
  :hook (rust-mode . eglot-ensure))

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
