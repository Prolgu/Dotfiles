;; 
(use-package evil
  :init
	(setq evil-want-integration t)
	(setq evil-want-keybinding nil)
	(setq evil-want-C-u-scroll nil)
	(setq evil-want-C-d-scroll nil)
	(setq evil-want-C-i-jump nil)
  :config
	(evil-mode 1)
	(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
	(define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

	;; Use visual line motions even outside of visual-line-mode buffers
	(evil-global-set-key 'motion "j" 'evil-next-visual-line)
	(evil-global-set-key 'motion "k" 'evil-previous-visual-line)

	(evil-set-initial-state 'messages-buffer-mode 'normal)
	(evil-set-initial-state 'dashboard-mode 'normal))

(setq evil-normal-state-tag "NORMAL"
	  evil-insert-state-tag "INSERT"
	  evil-visual-state-tag "VISUAL")

;; run `M-x list-faces-display` in a fresh emacs to get a list of faces on your emacs

(use-package evil-goggles
  :init
  (setq evil-goggles-enable-change t
        evil-goggles-enable-delete t
        evil-goggles-pulse         t
        evil-goggles-duration      0.15)
  :config
  (evil-goggles-mode)
	(custom-set-faces
	'(evil-goggles-delete-face ((t (:inherit 'shadow))))
	'(evil-goggles-paste-face ((t (:inherit 'lazy-highlight))))
	'(evil-goggles-yank-face ((t (:inherit 'query-replace)))))
)

;; (use-package evil-nerd-commenter
;;   :bind ("gc" . evilnc-comment-or-uncomment-lines))

;; 
(use-package general
	:after evil
	:config
	(general-create-definer efs/leader-keys
		:keymaps '(normal insert visual emacs)
		:prefix ","
		:global-prefix ",")

	(efs/leader-keys
		"t t"  '(lambda () (interactive) (vterm-toggle))
		"q"  '(lambda () (interactive) (quit-window))
		"m p"  '(lambda () (interactive) (simple-mpc))
		;; "tt" '(counsel-load-theme :which-key "choose theme")
		;; "eb" '(lambda () (interactive) (find-file (expand-file-name "~/.emacs.d/Emacs.org")))
		;; Config edit
		"f e" '(lambda () (interactive) (find-file (expand-file-name "init.el" user-emacs-directory)))
		;; Config reload
		"f r" '(lambda () (interactive) (load-file (expand-file-name "init.el" user-emacs-directory)))

		))

;; (defun open-init ()
;;   "Abre el archivo de configuracion"
;;   (lambda ()
;; 	(interactive)
;; 	(find-init-file)))




(use-package evil-collection
	:after evil
	:config
	(evil-collection-init))


(use-package move-text
  :bind
  ("M-<up>" . move-text-up)
  ("M-<down>" . move-text-down))

(defun move-mpc-down ()
  (interactive)
  (evil-next-visual-line)
  (mpc-select))

(defun move-mpc-up ()
  (interactive)
  (evil-previous-visual-line)
  (mpc-select))

(general-define-key
 :keymaps 'mpc-mode-map
 :states 'normal
 "j" 'move-mpc-down
 "k" 'move-mpc-up
 "t" 'mpc-toggle-play
 "r" 'mpc-toggle-repeat
 "s" 'mpc-toggle-shuffle
 "S" 'mpc-toggle-shuffle
 "c" 'mpc-toggle-consume
 "a" 'mpc-playlist-add
 "p" 'mpc-playlist
 ">" 'mpc-next
 "<" 'mpc-prev
 "R" 'mpc-playlist-delete
 "RET" 'mpc-select
 "x" 'mpc-play-at-point)


(provide 'init-evil)
