
(use-package helm
	:config
	(helm-mode)
	(require 'helm-config)
	(setq helm-input-idle-delay                     0.01
			helm-mode-line-string nil
			helm-ff-auto-update-initial-value nil
			helm-find-files-doc-header nil
			helm-display-header-line nil
			helm-display-buffer-default-width nil
			helm-display-buffer-default-height 0.30
			helm-reuse-last-window-split-state        t
			helm-always-two-windows                   t
			helm-split-window-inside-p                t
			;; helm-commands-using-frame                 '(completion-at-point
			;; 											helm-apropos
			;; 											helm-eshell-prompts
			;; 											helm-imenu
			;; 											helm-imenu-in-all-buffers)
			helm-semantic-fuzzy-match 				  t
			helm-apropos-fuzzy-match 				  t
			helm-locate-fuzzy-match 				  t
			helm-imenu-fuzzy-match    				  t
			helm-recentf-fuzzy-match    			  t
			helm-M-x-fuzzy-match 					  t
			helm-actions-inherit-frame-settings       t
			helm-use-frame-when-more-than-two-windows nil
			helm-use-frame-when-dedicated-window      nil
			helm-frame-background-color               "DarkSlateGray"
			helm-show-action-window-other-window      'right
			helm-allow-mouse                          t
			helm-move-to-line-cycle-in-source         t
			helm-autoresize-max-height                10 ; it is %.
			helm-autoresize-min-height                10 ; it is %.
	;;        helm-debug-root-directory                 "/home/thierry/tmp/helm-debug"
			helm-follow-mode-persistent               t
			helm-candidate-number-limit               500
			;; helm-fuzzy-search-fn					  t
			helm-visible-mark-prefix                  "✓")
			(set-face-foreground 'helm-mark-prefix "gold")
			(add-to-list 'helm-sources-using-default-as-input 'helm-source-info-bash)
			(helm-define-key-with-subkeys global-map (kbd "C-c n") ?n 'helm-cycle-resume))

;; (setq helm-boring-buffer-regexp-list
;; 	  (list
;; 	   (rx "*magit-")
;; 	   (rx "*helm")
;; 	   (rx "*clang")
;; 	   (rx "*messages")
;; 	   ))

;; ignore some buffers from C-x b
(require 'helm-buffers)
(setq helm-ff-skip-boring-files t)
(dolist (regexp
		 '("\\`\\*direnv"
		   "\\`\\*straight"
		   "\\`\\*xref"
		   "\\`\\*Messages"
		   "\\`\\*lsp-log"
		   "\\`\\*rust-analyzer"
		   "\\`\\*company"
		   "\\`\\*Vterm"
		   "\\`\\*clangd"))
  (cl-pushnew regexp helm-boring-buffer-regexp-list))


(setq-default helm-display-function 'helm-default-display-buffer)
;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details
(use-package helm-xref)

;; (define-key global-map [remap find-file] #'helm-find-files)
;; (define-key global-map [remap execute-extended-command] #'helm-M-x)
;; (define-key global-map [remap switch-to-buffer] #'helm-mini)
;; (define-key global-map [remap occur] #'helm-occur)

;; Helm Keys
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-c r r") 'helm-recentf)
(global-set-key (kbd "C-c l") 'helm-locate)
(global-set-key (kbd "C-c h i") 'helm-info)
(global-set-key (kbd "C-c h x") 'helm-register)
(global-set-key (kbd "C-c h s") 'helm-surfraw)
(global-set-key (kbd "C-c c i") 'helm-semantic-or-imenu)
(global-set-key (kbd "C-c h g") 'helm-google-suggest)
(global-set-key (kbd "C-s") 'helm-occur)

(define-key global-map [remap apropos]    #'helm-apropos)
(define-key global-map [remap find-library] #'helm-locate-library)
(define-key global-map [remap bookmark-jump] #'helm-bookmarks)
(define-key global-map [remap execute-extended-command]  #'helm-M-x)
(define-key global-map [remap find-file]  #'helm-find-files)
(define-key global-map [remap locate] #'helm-locate)
(define-key global-map [remap imenu]  #'helm-semantic-or-imenu)
(define-key global-map [remap noop-show-kill-ring] #'helm-show-kill-ring)
;; (define-key global-map [remap persp-switch-to-buffer]    #'+helm/workspace-mini)
(define-key global-map [remap switch-to-buffer] #'helm-buffers-list)
;; (define-key global-map [remap projectile-find-file]      #'+helm/projectile-find-file)
;; (define-key global-map [remap projectile-recentf] #'helm-projectile-recentf)
;; (define-key global-map [remap projectile-switch-project] #'helm-projectile-switch-project)
;; (define-key global-map [remap projectile-switch-to-buffer] #'helm-projectile-switch-to-buffer)
(define-key global-map [remap recentf-open-files]  #'helm-recentf)
(define-key global-map [remap yank-pop]  #'helm-show-kill-ring)
;; (define-key helm-map (kbd "<left>") 'backward-char)
;; (define-key helm-map (kbd "<right>") 'forward-char)
;; (setq helm-ff-lynx-style-map nil)

;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (global-set-key (kbd "C-c r e") 'helm-regexp)
;; (global-set-key (kbd "C-x C-r") 'dired)

;; (use-package helm-posframe
;; :config (helm-posframe-enable))


;; (use-package helm-projectile
;;   :after projectile
;;   :config (helm-projectile-mode))


;; (use-package helm-fzf
;; 	:straight (helm-fzf :type git :host github :repo "ibmandura/helm-fzf"))
;; 	(use-package helm-make
;; 	:custom
;; 	(helm-make-build-dir "build"))

(use-package helm-rg)
;; (use-package helm-flyspell)
(use-package helm-lsp
	:commands helm-lsp-workspace-symbol)
;; (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)


(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'markdown-mode-hook 'flyspell-mode)




;; Custom sources
(setq data '(("John" . "john@email.com")
             ("Jim" . "jim@email.com")
             ("Jane" . "jane@email.com")
             ("Jill" . "jill@email.com")))

(setq some-helm-source
      `((name . "HELM at the Emacs")
        (candidates . ,data)
        (action . (lambda (candidate)
                    (helm-marked-candidates)))))

(defun helm-select-and-insert-emails ()
	(interactive)
	(insert
	(mapconcat 'identity
				(helm :sources '(some-helm-source))
				",")))









(provide 'init-helm)
