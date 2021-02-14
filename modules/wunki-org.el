;;; -*- lexical-binding: t -*-
;;; wunki-org.el --- Your personal everything manager.

(require 'wunki-package)

(defvar org-root (expand-file-name "~/Notes"))

(when (wunki/is-windows)
  (add-to-list 'exec-path "c:/Program Files/SQLite3")
  (defvar org-root (expand-file-name "~/Notes")))

(use-package org
  :ensure org-plus-contrib
  :bind ("C-c c" . org-capture)
  :config
  ;; Stop org-mode from highjacking shift-cursor keys.
  (setq org-replace-disputed-keys t
        org-startup-indented t
        org-agenda-files `(,org-root)
        org-capture-templates
        `(("t" "Inbox" entry (file+headline ,(concat org-root "/inbox.org") "Inbox")
           "* TODO %?\n  %i\n  %a")))
  :hook (org-mode . visual-line-mode))

(use-package org-roam
  :ensure t
  :delight " 𝕫"
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/notes/zettel")
  :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n t" . org-roam-dailies-find-today)
               ("C-c n w" . org-roam-dailies-find-tomorrow)
               ("C-c n y" . org-roam-dailies-find-yesterday)
               ("C-c n d" . org-roam-date)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph-show)
               ("C-c n <left>" . org-roam-dailies-find-previous-note)
               ("C-c n <right>" . org-roam-dailies-find-next-note))
         :map org-mode-map
              (("C-c n i" . org-roam-insert)
               ("C-c n I" . org-roam-insert-immediate)))
  :config
  (setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         #'org-roam-capture--get-point
         "* %?"
         :file-name "daily/%<%Y-%m-%d>"
         :head "#+title: %<%A, %d %B %Y>\n\n* I am grateful for?\n\n* I will focus on?\n\n* Tasks\n"))))

(use-package org-superstar
  :ensure t
  :after org
  :config
  (setq org-superstar-remove-leading-stars t)
  (setq org-superstar-special-todo-items t)
  :hook (org-mode . org-superstar-mode))

;; easily export org to hugo
(use-package ox-hugo
  :ensure t
  :after ox)

;; focussed writing
(use-package olivetti
  :diminish
  :config
  (setq olivetti-body-width 0.7)
  (setq olivetti-minimum-body-width 80)
  (setq olivetti-recall-visual-line-mode-entry-state t))

;; easily insert links
(use-package org-cliplink
  :after (org)
  :config
  (define-key org-mode-map (kbd "C-c M-l") 'org-cliplink))

;; easily record notes on specific projects
(use-package org-projectile
  :init (org-projectile-per-project)
  :bind ("C-c n p" . org-projectile-project-todo-completing-read)
  :config
  (progn
    (setq org-projectile-per-project-filepath (concat org-root "/projects.org"))
    (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
    (push (org-projectile-project-todo-entry) org-capture-templates)))

(provide 'wunki-org)
