;;; -*- lexical-binding: t -*-
;;; wunki-languages.el --- Languages not deserving of their own config

(use-package yaml-mode
  :commands yaml-mode
  :mode "\\.ya?ml\'")

(use-package dockerfile-mode
  :commands dockerfile-mode
  :mode "Dockerfile.*\\'")

(use-package fish-mode
  :mode ("\\.fish\\'" "/fish_funced\\..*\\'")
  :interpreter "fish")

(use-package toml-mode
  :mode "\\.toml\\'")

(use-package hcl-mode
  :commands hcl-mode
  :mode "\\.nomad\\'")

(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . gfm-mode)
  :hook (markdown-mode . flyspell-mode)
  :commands (markdown-mode gfm-mode))

(provide 'wunki-languages)
