;;; -*- lexical-binding: t -*-
;;; wunki-elm.el --- Haskell for beginners

(use-package elm-mode
  :init
  (add-to-list 'company-backends 'company-elm)
  (setq elm-indent-offset 2)
  :hook (elm-mode . elm-oracle-setup-completion))

(provide 'wunki-elm)
;;; wunki-elm.el ends here
