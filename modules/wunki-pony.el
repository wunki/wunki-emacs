;;; -*- lexical-binding: t -*-
;;; wunki-pony.el --- Rust and Erlang got a baby, called it Pony

(use-package ponylang-mode
  :config
  (progn
    (add-hook
     'ponylang-mode-hook
     (lambda ()
       (set-variable 'indent-tabs-mode nil)
       (set-variable 'tab-width 2)))))

(provide 'wunki-pony)
;;; wunki-pony.el ends here
