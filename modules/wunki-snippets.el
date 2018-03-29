;;; -*- lexical-binding: t -*-
;;; -snippets.el --- Where there is boilerplate, there must be snippets.

(require 'wunki-package)

;; The s.el package contains a lot of functions useful in snippets.
(use-package s)


(use-package yasnippet
  :commands (yas-global-mode yas-minor-mode)
  :config (yas-global-mode 1)
  :diminish yas-minor-mode)

(provide 'wunki-snippets)
;;; wunki-snippets.el ends here
