;;; -*- lexical-binding: t -*-
;;; wunki-appearance.el --- The looks of Emacs
(require 'wunki-package)

;; Get rid of any bars
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Set the font
(defun wunki/set-font (font)
  (add-to-list 'default-frame-alist (cons 'font font))
  (set-face-attribute 'default nil :font font)
  (set-frame-font font nil t))

(if (wunki/is-mac)
  (wunki/set-font "Operator Mono-14")
  (wunki/set-font "OperatorMonoBook-9"))

;; set the theme
(use-package doom-themes
  :init
  (progn
    (setq doom-themes-enable-italic t)
    (load-theme 'doom-city-lights t))
  :config
  (progn
    (doom-themes-org-config)))

;; Remove stuff from the modeline
(use-package diminish)

;; When not in a terminal, configure a few window system specific things.
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))

;; Show line numbers in buffers.
(global-linum-mode t)
(setq linum-format (if (not window-system) "%4d " "%4d"))

;; Highlight the line number of the current line.
(use-package hlinum
             :config
             (hlinum-activate))

;; Show column numbers in modeline.
(setq column-number-mode t)

;; Ensure linum-mode is disabled in certain major modes.
(setq linum-disabled-modes
      '(term-mode slime-repl-mode magit-status-mode help-mode nrepl-mode
        mu4e-main-mode mu4e-headers-mode mu4e-view-mode
        mu4e-compose-mode))
(defun linum-on ()
  (unless (or (minibufferp) (member major-mode linum-disabled-modes))
    (linum-mode 1)))

;; Highlight matching braces.
(show-paren-mode 1)

(provide 'wunki-appearance)
;;; wunki-appearance.el ends here
