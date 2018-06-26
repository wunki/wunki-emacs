;;; -*- lexical-binding: t -*-
;;; wunki-clojure.el --- If you like your parentheses Java flavoured.

(use-package clojure-mode
  :commands clojure-mode
  :hook ((clojure-mode . yas-minor-mode)
         (clojure-mode . eldoc-mode)))

(use-package clj-refactor
  :commands clj-refactor-mode
  :config (cljr-add-keybindings-with-prefix "C-c C-r")
  :hook (clojure-mode . clj-refactor-mode))

(use-package cider
  :commands cider-mode
  :config
  (setq cider-repl-display-help-banner 'nil))

(provide 'wunki-clojure)
;;; wunki-clojure.el ends here
