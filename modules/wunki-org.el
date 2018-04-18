;;; -*- lexical-binding: t -*-
;;; wunki-org.el --- Your personal everything manager.

(require 'wunki-package)

(defvar org-root (expand-file-name "~/notes"))

(use-package org
  :ensure org-plus-contrib
  :bind ("C-c c" . org-capture)
  :config
  ;; Stop org-mode from highjacking shift-cursor keys.
  (setq org-replace-disputed-keys t)
  (setq org-capture-templates
        `(("t" "Inbox" entry (file+headline ,(concat org-root "/inbox.org") "Tasks")
           "* TODO %?\n  %i\n  %a"))))

(use-package org-bullets
  :after (org)
  :hook (org-mode . org-bullets-mode))

(use-package org-cliplink
  :after (org)
  :config
  (define-key org-mode-map (kbd "C-c M-l") 'org-cliplink))

(use-package org-projectile
  :init (org-projectile-per-project)
  :bind ("C-c n p" . org-projectile-project-todo-completing-read)
  :config
  (progn
    (setq org-projectile-per-project-filepath "notes.org")
    (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
    (push (org-projectile-project-todo-entry) org-capture-templates)))

(provide 'wunki-org)
