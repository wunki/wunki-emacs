;;; -*- lexical-binding: t -*-
;;; wunki-haskell.el --- FIRE ALL MONAD TRANSFORMERS

(use-package intero
  :commands intero-mode)

(use-package haskell-mode
  :commands haskell-mode
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))

(provide 'wunki-haskell)
