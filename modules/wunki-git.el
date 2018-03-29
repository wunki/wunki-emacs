;;; -*- lexical-binding: t -*-
;;; wunki-git.el --- Things for working with Git.

(require 'wunki-package)

;; Invoke Magit by typing C-x g, and you can thank me later.
;; See http://magit.github.io/ for instructions.
(use-package magit
  :commands magit-status
  :bind ("C-x g" . magit-status))

;; Use M-x gist-buffer or M-x gist-region to create a gist
;; directly from the current buffer or selection.
(use-package gist)

;; Mark uncommitted changes in the fringe.
(use-package git-gutter-fringe
  :config
  (global-git-gutter-mode t)
  :diminish git-gutter-mode)
