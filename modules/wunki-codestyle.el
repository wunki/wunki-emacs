;;; -*- lexical-binding: t -*-
;;; ohai-codestyle.el --- This is where you apply your OCD.

(require 'wunki-package)

;; Tab indentation is a disease; a cancer of this planet.
;; Turn it off and let's never talk about this default again.
(set-default 'indent-tabs-mode nil)

;; The fact that we have to do this is also quite embarrassing.
(setq sentence-end-double-space nil)

;; Always indent after a newline.
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Strict whitespace with ethan-wspace: highlight bad habits,
;; and automatically clean up your code when saving.
;; Use C-c w to instantly clean up your file.
(use-package ethan-wspace
  :demand t
  :commands global-ethan-wspace-mode
  :config (global-ethan-wspace-mode 1)
  :bind ("C-c w" . ethan-wspace-clean-all)
  :diminish ethan-wspace-mode)

(setq mode-require-final-newline nil)
(setq require-final-newline nil)

;; Set default indentation for various languages (add your own!)
(setq-default tab-width 2)
;; Javascript
(setq-default js2-basic-offset 2)
;; JSON
(setq-default js-indent-level 2)
;; Python
(setq-default py-indent-offset 2)
;; XML
(setq-default nxml-child-indent 2)
;; C
(setq-default c-basic-offset 2)
;; HTML etc with web-mode
(setq-default web-mode-markup-indent-offset 2
              web-mode-css-indent-offset 2
              web-mode-code-indent-offset 2
              web-mode-style-padding 2
              web-mode-script-padding 2)

;; Set the default formatting styles for various C based modes.
;; Particularly, change the default style from GNU to Java.
(setq c-default-style
      '((awk-mode . "awk")
        (other . "java")))

(provide 'wunki-codestyle)
