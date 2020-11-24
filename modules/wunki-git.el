;;; -*- lexical-binding: t -*-
;;; wunki-git.el --- Things for working with Git.

(require 'wunki-package)

(defun turn-off-whitespace-mode ()
  "Unconditionally turn off Whitespace mode."
  (ethan-wspace-mode -1))

;; Invoke Magit by typing C-c g.
(use-package magit
  :commands magit-status
  :bind ("C-c g" . magit-status)
  :config
  (setq magit-completing-read-function 'ivy-completing-read)
  :hook (git-commit-setup . turn-off-whitespace-mode))

;; Use M-x gist-buffer or M-x gist-region to create a gist
;; directly from the current buffer or selection.
(use-package gist)

;; Mark uncommitted changes in the fringe.
(use-package git-gutter-fringe
  :config
  (global-git-gutter-mode t)
  :diminish git-gutter-mode)

(provide 'wunki-git)
