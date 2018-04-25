;;; -*- lexical-binding: t -*-
;;; wunki-twitter.el --- Because I like to sing like a bird

(use-package twittering-mode
  :commands twittering-mode
  :bind ("C-c C-t" . twittering-update-status-interactive))

(provide 'wunki-twitter)
;;; wunki-twitter.el ends here
