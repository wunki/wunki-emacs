;;; -*- lexical-binding: t -*-
;;; wunki-appearance.el --- The looks of Emacs
(require 'wunki-package)

;; Get rid of any bars
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Font configuration and settings
(defvar wunki/font-choice (cond
                           ((wunki/is-mac) "Dank Mono-14")
                           ((wunki/is-windows) "Operator Mono Book-9")
                           (t "OperatorMonoSsmBook-8")))

(defun wunki/set-font (font)
  "makes it a bit easier to set the font"
  (interactive "sfont: ")
  (add-to-list 'default-frame-alist (cons 'font font))
  (set-face-attribute 'default nil :font font)
  (set-frame-font font nil t))
(wunki/set-font wunki/font-choice)

(use-package default-text-scale
  :commands default-text-scale-mode
  :config
  (default-text-scale-mode))

;; Brighten buffers which are active
(use-package solaire-mode
  :commands solaire-mode
  :init (progn
          (solaire-mode))
  :hook (((after-change-major-mode magit-mode cider-repl-mode) . turn-on-solaire-mode)
         (minibuffer-setup . solaire-mode-in-minibuffer)))

;; Use Doom themes
(use-package doom-themes
  :init
  (progn
    (setq doom-themes-enable-bold nil)
    (setq doom-themes-enable-italic t)
    (load-theme 'doom-city-lights t))
  :config
  (progn
    (set-face-italic 'font-lock-comment-face t)
    (doom-themes-org-config)
    (doom-themes-neotree-config)
    (solaire-mode-swap-bg)))

;; When using daemon mode, the theme is not set correctly
;; these methods enable us to quickly reload the theme.
(defun wunki/reload-theme ()
  (interactive)
  (load-theme 'doom-city-lights t)
  (set-face-italic 'font-lock-comment-face t)
  (wunki/set-font wunki/font-choice)
  (doom-themes-neotree-config)
  (solaire-mode-swap-bg))
(global-set-key (kbd "C-c C-r") 'wunki/reload-theme)

;; Remove stuff from the modeline
(use-package diminish)

;; a pretty modeline
(use-package minions
  :init (minions-mode)
  :config
  (setq
   minions-mode-line-lighter "#"
   minions-direct '(flycheck-mode
                    cider-mode)))

(use-package moody
  :config
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))

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

(use-package neotree
  :config
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (setq neo-window-fixed-size nil)
  (add-to-list 'window-size-change-functions
               (lambda (frame)
                 (let ((neo-window (neo-global--get-window)))
                   (unless (null neo-window)
                     (setq neo-window-width (window-width neo-window))))))
  :bind ("C-c t" . neotree-toggle))

;; Show column numbers in modeline.
(setq column-number-mode t)

;; Ensure linum-mode is disabled in certain major modes.
(setq linum-disabled-modes
      '(term-mode slime-repl-mode magit-status-mode help-mode cider-repl-mode
                  mu4e-main-mode mu4e-headers-mode mu4e-view-mode
                  mu4e-compose-mode intero-repl-mode))
(defun linum-on ()
  (unless (or (minibufferp) (member major-mode linum-disabled-modes))
    (linum-mode 1)))

;; Highlight matching braces.
(show-paren-mode 1)

;; highlight the current line
(global-hl-line-mode 1)

(provide 'wunki-appearance)
;;; wunki-appearance.el ends here
