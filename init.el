;;; -*- lexical-binding: t -*-
;;; init.el --- This is where all emacs start.

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;;; Enable native compilation
(setq comp-speed 2)

;; Figure out the current hostname.
(setq hostname (replace-regexp-in-string "\\(^[[:space:]\n]*\\|[[:space:]\n]*$\\)" "" (with-output-to-string (call-process "hostname" nil standard-output))))

;; Figure out the path to our .emacs.d by getting the path part of the
;; current file (`init.el`).
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) (file-chase-links load-file-name))))

;; My personal library files
(add-to-list 'load-path (concat dotfiles-dir "modules"))

;; Define where we want to keep `loaddefs.el` (our autoload declarations) and
;; `custom.el` (our user settings file).
(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq custom-file (concat dotfiles-dir "custom.el"))

;; Load the user settings from `custom.el`.
(load custom-file 'noerror)

;; Load my modules
(require 'wunki-package)      ;; setup package management
(require 'wunki-lib)          ;; usuful methods
(require 'wunki-help)         ;; further improve help
(require 'wunki-settings)     ;; common settings
(require 'wunki-navigation)   ;; moving around
(require 'wunki-appearance)   ;; theme and fonts
(require 'wunki-shell)        ;; required configuration
(require 'wunki-eshell)       ;; eshell
(require 'wunki-codestyle)    ;; tabs, spaces, etc.
(require 'wunki-editing)      ;; some defaults for editing files
(require 'wunki-languages)    ;; language modes which are generic
(require 'wunki-lsp)          ;; language-server-protocol
(require 'wunki-flycheck)
(require 'wunki-completions)
(require 'wunki-snippets)
(require 'wunki-projects)
(require 'wunki-org)
(require 'wunki-mu)
(require 'wunki-git)
(require 'wunki-c)
(require 'wunki-elisp)
(require 'wunki-elixir)
(require 'wunki-clojure)
(require 'wunki-csharp)
(require 'wunki-rust)
(require 'wunki-go)
(require 'wunki-zig)
(require 'wunki-html)
(require 'wunki-twitter)
(require 'wunki-erc)
