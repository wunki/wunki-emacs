;;; -*- lexical-binding: t -*-
;;; wunki-html.el --- HTML/CSS and Javascript

(use-package web-mode
  :mode ("\\.html$" . web-mode)
  :init
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-enable-engine-detection t)

  (setq web-mode-enable-auto-pairing nil)
  (setq web-mode-enable-auto-expanding t)
  (setq web-mode-enable-css-colorization t))

(provide 'wunki-html)
;;; wunki-html.el ends here
