;;; -*- lexical-binding: t -*-
;;; wunki-shell.el --- Set the executable search path from the user shell.

;;; Code:

;; To ensure availability of command line tools, we try to get Emacs's
;; executable path from your shell configuration using the
;; `exec-path-from-shell' package.

(paradox-require 'exec-path-from-shell)

(when (memq window-system '(x mac ns))
  (exec-path-from-shell-initialize))

(provide 'wunki-configure)
;;; wunki-shell.el ends here
