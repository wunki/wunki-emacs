;;; -*- lexical-binding: t -*-
;;; wunki-clojure.el --- If you like your parentheses Java flavoured.

(defun add-clj-format-before-save ()
  (interactive)
  (add-hook 'before-save-hook
            'cider-format-buffer
            t
      t))

(use-package clojure-mode
  :commands clojure-mode
  :defer t
  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.edn\\'" . clojure-mode))
  :hook
  (clojure-mode . yas-minor-mode)
  (clojure-mode . subword-mode)
  (clojure-mode . eldoc-mode)
  (clojure-mode . add-clj-format-before-save))

(use-package parinfer
  :ensure t
  :bind
  (("C-," . parinfer-toggle-mode))
  :init
  (progn
    (setq parinfer-extensions
          '(defaults
            pretty-parens
            paredit
            smart-tab
            smart-yank))
    (add-hook 'clojure-mode-hook #'parinfer-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
    (add-hook 'common-lisp-mode-hook #'parinfer-mode)
    (add-hook 'scheme-mode-hook #'parinfer-mode)
    (add-hook 'lisp-mode-hook #'parinfer-mode))
  :config
    (electric-pair-local-mode -1))

(use-package clj-refactor
  :commands clj-refactor-mode
  :defer t
  :config (cljr-add-keybindings-with-prefix "C-c C-r")
  :hook ((clojure-mode . clj-refactor-mode)
         (clojure-mode . paren-face-mode)))

(use-package cider
  :commands cider-mode
  :defer t
  :config
  (setq cider-repl-display-help-banner 'nil
        cider-prompt-for-symbol 'nil
        cider-font-lock-dynamically t
        nrepl-hide-special-buffers t)
  :hook ((cider-mode . eldoc-mode)
         (cider-repl-mode . eldoc-mode)))

(provide 'wunki-clojure)
;;; wunki-clojure.el ends here
