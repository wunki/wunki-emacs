;;; -*- lexical-binding: t -*-
;;; wunki-mu.el --- Best way to deal with email

(use-package mu4e
  :ensure f
  :commands mu4e
  :bind ("C-c m" . mu4e)
  :config
  ;; generic emacs configuration for email
  (setq mail-user-agent 'mu4e-user-agent
        ;; don't keep message buffers around
        message-kill-buffer-on-exit t)

  ;; mu4e configuration
  (setq mu4e-get-mail-command "mbsync -a"
        mu4e-change-filenames-when-moving t
        mu4e-maildir "~/mail"
        mu4e-context-policy 'pick-first
        mu4e-compose-context-policy nil
        mu4e-confirm-quit nil)
  (setq mu4e-contexts
        `( ,(make-mu4e-context
             :name "Personal"
             :enter-func (lambda () (mu4e-message "Entering personal context"))
             :leave-func (lambda () (mu4e-message "Leaving personal context"))
             :match-func (lambda (msg)
                           (when msg
                             (string-match-p "^/wunki" (mu4e-message-field msg :maildir))))
             :vars '((user-mail-address      . "petar@wunki.org")
                     (user-full-name         . "Petar Radosevic")
                     (mu4e-sent-folder       .  "/wunki/sent")
                     (mu4e-trash-folder      .  "/wunki/trash")
                     (mu4e-refile-folder     .  "/wunki/archive")
                     (mu4e-drafts-folder     .  "/wunki/drafts")
                     (mu4e-compose-signature . (concat
                                                "Petar Radosevic\n"
                                                "petar@wunki.org"))))
           ,(make-mu4e-context
             :name "Degreed"
             :enter-func (lambda () (mu4e-message "Entering Degreed context"))
             :leave-func (lambda () (mu4e-message "Leaving Degreed context"))
             :match-func (lambda (msg)
                           (when msg
                             (string-match-p "^/degreed" (mu4e-message-field msg :maildir))))
             :vars '((user-mail-address      . "petar@degreed.com")
                     (user-full-name         . "Petar Radosevic")
                     (mu4e-sent-folder       .  "/degreed/sent")
                     (mu4e-trash-folder      .  "/degreed/trash")
                     (mu4e-refile-folder     .  "/degreed/archive")
                     (mu4e-drafts-folder     .  "/degreed/drafts")
                     (mu4e-compose-signature . (concat
                                                "Petar Radosevic\n"
                                                "petar@degreed.com")))))))

(provide 'wunki-mu)
