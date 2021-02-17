;;; -*- lexical-binding: t -*-
;;; wunki-flycheck.el --- Spot all the errors.

(require 'wunki-package)

;; Bind M-n and M-p to navigate to the next/previous errors.
(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)

;; Install Flycheck.
(use-package flycheck
  :commands flycheck-mode
  :init (global-flycheck-mode)
  :config
  (setq flycheck-global-modes '(not org-mode)))

;; Turn the modeline red when Flycheck has errors.
(use-package flycheck-color-mode-line
  :config
  (with-eval-after-load "flycheck"
    (setq flycheck-highlighting-mode 'symbols)
    (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)))

;; (with-eval-after-load "helm"
;;   (use-package helm-flycheck
;;     :bind (("C-c ! !" . helm-flycheck))))

(provide 'wunki-flycheck)
