;;; -*- lexical-binding: t -*-
;;; wunki-csharp.el --- C# language support.

(use-package csharp-mode
  :commands csharp-mode
  :init
  (setq c-basic-offset 4)
  (setq tab-width 4)
  :hook (csharp-mode . flycheck-mode))

(use-package omnisharp
  :commands omnisharp-mode
  :init
  (setq omnisharp-server-executable-path (if (wunki/is-mac)
                                             "/Users/wunki/Downloads/omnisharp-osx/run"
                                             "/opt/omnisharp-roslyn/OmniSharp.exe"))
  :hook (csharp-mode . omnisharp-mode))

(provide 'wunki-csharp)
