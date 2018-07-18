;;; -*- lexical-binding: t -*-
;;; wunki-c.el --- Pedal to the metal!

(use-package cquery
  :commands (lsp-cquery-enable)
  :hook (c-mode-common . lsp-cquery-enable)
  :config
  (setq cquery-executable "/usr/sbin/cquery")
  (setq cquery-extra-init-params '(:completion (:detailedLabel t))))

(provide 'wunki-c)
;;; wunki-c.el ends here
