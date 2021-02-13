;;; -*- lexical-binding: t -*-
;;; wunki-ligatures.el --- Enable ligatures
(use-package ligature
  :load-path "~/.emacs.d/elisp/ligature"
  :config
  (ligature-set-ligatures 'elixir-mode '("->" "==" "!=" "|>"))

  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

(provide 'wunki-ligatures)
;;; wunki-ligatures.el ends here
