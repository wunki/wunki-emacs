;;; -*- lexical-binding: t -*-
;;; wunki-elisp.el --- Making your lisp sound more pleasant.

(require 'wunki-package)

;; Working with parenthesis just became a lot easier
(use-package paredit
  :commands paredit-mode
  :config
  (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
  ;; Setup C-c v to eval whole buffer in all lisps.
  (define-key lisp-mode-shared-map (kbd "C-c v") 'eval-buffer)
  :diminish paredit-mode)

;; Highlight the sexp under the cursor.
(use-package highlight-parentheses
  :commands highlight-parentheses-mode
  :config
  (add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode)
  :diminish highlight-parentheses-mode)

;; When saving an elisp file, remove its compiled version if
;; there is one, as you'll want to recompile it.
(defun wunki-elisp/remove-elc-on-save ()
  "If you're saving an elisp file, likely the .elc is no longer valid."
  (make-local-variable 'after-save-hook)
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))))
(add-hook 'emacs-lisp-mode-hook 'wunki-elisp/remove-elc-on-save)

;; Enable eldoc mode, which provides context based documentation
;; in the minibuffer.
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

;; eros-mode will show you the result of evaluating an elisp command
;; as an overlay in your elisp buffer. Try it out with C-x C-e now!
(use-package eros
  :commands eros-mode
  :config
  (add-hook 'emacs-lisp-mode-hook 'eros-mode))

;; Use M-. to jump to the definition of the symbol under the cursor.
(define-key emacs-lisp-mode-map (kbd "M-.") 'find-function-at-point)

(provide 'wunki-elisp)
