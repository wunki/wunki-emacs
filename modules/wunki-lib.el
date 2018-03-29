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

(defun wunki/kill-region-or-backward-word ()
  "Kill either the word backwards or the active region"
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word 1)))

(provide 'wunki-lib)
;;; wunki-lib.el ends here
