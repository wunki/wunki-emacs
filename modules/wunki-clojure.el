;;; -*- lexical-binding: t -*-
;;; wunki-clojure.el --- If you like your parentheses Java flavoured.

(use-package clojure-mode
  :commands clojure-mode)

(use-package clj-refactor
  :commands clj-refactor-mode
  :hook (clojure-mode . clj-refactor-mode))

(use-package cider
  :commands cider-mode
  :config
  (setq cider-repl-display-help-banner 'nil))

(provide 'wunki-clojure)
;;; wunki-clojure.el ends here
