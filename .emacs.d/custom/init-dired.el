
(use-package dired-single
	:commands (dired dired-jump))

(use-package all-the-icons-dired
	:hook (dired-mode . all-the-icons-dired-mode))

(use-package dired-open
	:commands (dired dired-jump)
	:config
	;; Doesn't work as expected!
	;;(add-to-list 'dired-open-functions #'dired-open-xdg t)
	(setq dired-open-extensions '(("png" . "feh")
									("mkv" . "mpv"))))

(use-package dired-hide-dotfiles
	:hook (dired-mode . dired-hide-dotfiles-mode))
  ;; :config
  ;; (evil-collection-define-key 'normal 'dired-mode-map
  ;;   "H" 'dired-hide-dotfiles-mode))

(add-hook 'dired-mode-hook
		  (lambda ()
			;; (dired-hide-details-mode)
			(dired-sort-toggle-or-edit)
			(dired-find-alternate-file)))

(provide 'init-dired)
