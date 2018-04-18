;;; -*- lexical-binding: t -*-
;;; wunki-languages.el --- Languages not deserving of their own config

(use-package yaml-mode
  :commands yaml-mode
  :mode ("\\.yml$" . yaml-mode))

(provide 'wunki-languages)
