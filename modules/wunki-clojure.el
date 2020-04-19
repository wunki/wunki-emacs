;;; -*- lexical-binding: t -*-
;;; wunki-clojure.el --- If you like your parentheses Java flavoured.

(use-package clojure-mode
  :commands clojure-mode
  :hook (clojure-mode . yas-minor-mode))

(use-package clj-refactor
  :commands clj-refactor-mode
  :config (cljr-add-keybindings-with-prefix "C-c C-r")
  :hook ((clojure-mode . clj-refactor-mode)
         (clojure-mode . paredit-mode)
         (clojure-mode . paren-face-mode)))

(use-package cider
  :commands cider-mode
  :config
  (setq cider-repl-display-help-banner 'nil
        cider-prompt-for-symbol 'nil)
  :hook ((cider-mode . eldoc-mode)
         (cider-repl-mode . eldoc-mode)))

(provide 'wunki-clojure)
;;; wunki-clojure.el ends here
