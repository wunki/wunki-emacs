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

(provide 'wunki-languages)
