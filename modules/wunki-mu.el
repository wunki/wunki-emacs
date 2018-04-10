;;; -*- lexical-binding: t -*-
;;; wunki-mu.el --- Best way to deal with email

(use-package mu4e
  :ensure f
  :commands mu4e
  :config
  ;; generic emacs configuration for email
  (setq mail-user-agent 'mu4e-user-agent
        ;; don't keep message buffers around
        message-kill-buffer-on-exit t)

  ;; mu4e configuration
  (setq mu4e-get-mail-command "mbsync -a"
        mu4e-sent-folder "/sent"
        mu4e-trash-folder "/trash"
        mu4e-refile-folder "/archive"
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
                             (mu4e-message-contact-field-matches msg :to "petar@wunki.org")))
             :vars '((user-mail-address      . "petar@wunki.org")
                     (user-full-name         . "Petar Radosevic")
                     (mu4e-maildir           . "~/mail/wunki")
                     (mu4e-compose-signature . (concat
                                                "Petar Radosevic"
                                                "petar@wunki.org"))))
           ,(make-mu4e-context
             :name "Degreed"
             :enter-func (lambda () (mu4e-message "Entering Degreed context"))
             :leave-func (lambda () (mu4e-message "Leaving Degreed context"))
             :match-func (lambda (msg)
                           (when msg
                             (mu4e-message-contact-field-matches msg :to "petar@degreed.com")))
             :vars '((user-mail-address      . "petar@degreed.com")
                     (user-full-name         . "Petar Radosevic")
                     (mu4e-maildir           . "~/mail/degreed")
                     (mu4e-compose-signature . (concat
                                                "Petar Radosevic"
                                                "petar@degreed.com")))))))

(provide 'wunki-mu)
