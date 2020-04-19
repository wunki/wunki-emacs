;;; -*- lexical-binding: t -*-
;;; wunki-elixir.el --- Clojure, but with Ruby syntax and a better runtime

(use-package elixir-mode
  :init (add-to-list 'exec-path "/Users/petar/Code/elixir-ls/release")
  :commands elixir-mode
  :hook (elixir-mode . lsp))

(provide 'wunki-elixir)
;;; wunki-clojure.el ends here
