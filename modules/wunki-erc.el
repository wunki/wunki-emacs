;;; -*- lexical-binding: t -*-
;;; wunki-erc.el --- IRC

(require 'secrets)

(use-package erc
  :commands erc-start-or-switch
  :bind ("C-c C-i" . erc-start-or-switch)
  :config
  ;; joining && autojoing

  ;; make sure to use wildcards for e.g. freenode as the actual server
  ;; name can be be a bit different, which would screw up autoconnect
  (erc-autojoin-mode t)
  (setq erc-autojoin-channels-alist
        '((".*\\.freenode.net" "#rust" "#rust-beginners")))

  ;; check channels
  (erc-track-mode t)
  (setq erc-track-exclude-types '("NICK" "JOIN" "PART" "QUIT" "MODE"
                                  "301" ; away notice
                                  "305" ; return from awayness
                                  "306" ; set awayness
                                  "324"
                                  "329"
                                  "332" ; topic notice
                                  "333" ; who set the topic
                                  "353" ; Names notice
                                  "324" ; modes
                                  "329" ; channel creation date
                                  "477")
        ;; don't show any of this
        erc-hide-list '("JOIN" "PART" "QUIT" "NICK")
        erc-header-line-format "%t: %o"
        erc-join-buffer 'bury
        erc-warn-about-blank-lines nil
        erc-interpret-mirc-color t
        ;; server conf
        erc-server-reconnect-attempts t
        erc-server-reconnect-timeout 10
        erc-keywords '("wunki"))

  (defun erc-start-or-switch ()
    "Connect to ERC, or switch to last active buffer"
    (interactive)
    (if (get-buffer "dino.wunki.org:6697") ;; ERC already active?
        (erc-track-switch-buffer 1) ;; yes: switch to last active
      (when (y-or-n-p "Start ERC? ") ;; no: maybe start ERC
        (erc-tls
         :server "dino.wunki.org"
         :port 6697
         :nick "wunki"
         :password secret-irc-mozilla-password
         :full-name "Petar Radosevic")))))

(global-set-key (kbd "<f12>") 'erc-start-or-switch)

(provide 'wunki-erc)
;;; wunki-erc.el ends here
