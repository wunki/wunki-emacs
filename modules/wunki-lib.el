;;; -*- lexical-binding: t -*-
;;; wunki-lib.el --- Utility functions for use elsewhere.

(require 'wunki-package)

;; Ensure the New Standard Library is installed and always available.
;; f.el    - files and paths  https://github.com/rejeep/f.el
;; s.el    - strings          https://github.com/magnars/s.el
;; dash.el - lists            https://github.com/magnars/dash.el
(use-package f)
(use-package s)
(use-package dash)

(defun wunki/is-exec (command)
  "Returns true if `command' is an executable on the system search path."
  (f-executable? (s-trim (shell-command-to-string (s-concat "which " command)))))

(defun wunki/is-mac ()
  "Returns true if running on a mac"
  (interactive)
  (string-equal system-type "darwin"))

(defun wunki/is-windows ()
  "Returns true if running on windows"
  (interactive)
  (string-equal system-type "windows-nt"))

(defun wunki/kill-region-or-backward-word ()
  "Kill either the word backwards or the active region"
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word 1)))

(defun wunki/mac-switch-meta nil
  "Switch meta between Option and Command"
  (interactive)
  (if (eq mac-option-modifier nil)
      (progn
        (setq mac-option-modifier 'meta)
        (setq mac-command-modifier 'hyper))
    (progn
      (setq mac-option-modifier nil)
      (setq mac-command-modifier 'meta))))

(defun wunki/sudo-edit (&optional arg)
  "Edit currently visited file as root.
   With a prefix ARG prompt for a file to visit.  Will also
   prompt for a file to visit if current buffer is not visiting a
   file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file (as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
(global-set-key (kbd "C-c s") 'wunki/sudo-edit)

(defun wunki/counsel-find-notes nil
  (interactive)
  (counsel-find-file "~/notes/"))

(defun wunki/insert-now (arg)
  (interactive "P")
  (insert (if arg
              (format-time-string "%d-%m-%Y")
            (format-time-string "%Y-%m-%d"))))

(provide 'wunki-lib)
;;; wunki-lib.el ends here
