;;; -*- lexical-binding: t -*-
;;; wunki-projects.el --- Your personal everything manager.

(require 'wunki-package)

;; Use project management with projectile. Love it!
(use-package projectile
  :demand t
  :commands projectile-global-mode
  :bind ("C-c C-f" . projectile-find-file)
  :config
  (setq projectile-indexing-method 'alien)
  (setq projectile-completion-system 'ivy)
  (projectile-global-mode +1)
  :diminish projectile-mode)

;; quickly search files in project
(use-package projectile-ripgrep
  :commands projectile-ripgrep
  :bind ("C-c C-a" . projectile-ripgrep))

;; Use ibuffer instead of list-buffers (C-x C-b) and sort by project.
(use-package ibuffer-projectile
  :bind ("C-x C-b" . ibuffer)
  :config
  (add-hook 'ibuffer-hook
            (lambda ()
              (ibuffer-projectile-set-filter-groups)
              (unless (eq ibuffer-sorting-mode 'alphabetic)
                (ibuffer-do-sort-by-alphabetic)))))

(provide 'wunki-projects)
