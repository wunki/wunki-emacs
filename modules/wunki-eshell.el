;;; -*- lexical-binding: t -*-
;;; ohai-eshell.el --- Make eshell marginally less intolerable.

(require 'wunki-lib)

;; Define a keybinding to get to your eshell quickly.
(global-set-key (kbd "C-c C-e") 'eshell)

;; Visual commands are commands which require a proper terminal.
;; eshell will run them in a term buffer when you invoke them.
(setq eshell-visual-commands
      '("less" "tmux" "htop" "top" "bash" "zsh" "fish"))
(setq eshell-visual-subcommands
      '(("git" "log" "l" "diff" "show")))

;; Define a pretty prompt.
(use-package eshell-git-prompt
  :config
  (eshell-git-prompt-use-theme 'powerline))

;; Disable company-mode for eshell, falling back to pcomplete,
;; which feels more natural for a shell.
(add-hook 'eshell-mode-hook
          (lambda ()
            (linum-mode -1)
            (company-mode 0)))

;; When completing with multiple options, complete only as much as
;; possible and wait for further input.
(setq eshell-cmpl-cycle-completions nil)

;; esh-autosuggest provides fish shell like autosuggestion from history.
(use-package esh-autosuggest
  :hook (eshell-mode . esh-autosuggest-mode))

;; Extend pcomplete with smart completion provided by the fish shell
(use-package fish-completion
  :if (wunki/is-exec "fish")
  :config
  (global-fish-completion-mode))

(provide 'wunki-eshell)

;;; wunki-eshell.el ends here
