
;; 
;; (use-package projectile
;;   :diminish projectile-mode
;;   :config (projectile-mode)
;;   :bind-keymap
;;   ("C-c p" . projectile-command-map)
;;   :init
;;   ;; NOTE: Set this to the folder where you keep your Git repos!
;;   (when (file-directory-p "~/Develop")
;;     (setq projectile-project-search-path '("~/Develop")))
;;   (setq projectile-switch-project-action #'projectile-dired))


;; NOTE: Make sure to configure a GitHub token before using this package!
;; - https://magit.vc/manual/forge/Token-Creation.html#Token-Creation
;; - https://magit.vc/manual/ghub/Getting-Started.html#Getting-Started
;; (use-package forge
;;   :after magit)

(use-package modern-cpp-font-lock)
(add-hook 'c++-mode-hook #'modern-c++-font-lock-mode)

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode)
  :config
	(setq hl-todo-keyword-faces
	'(("TODO"   . "#FFfff0")
		("FIXME"  . "#DB3340")
		("DEBUG"  . "#A020F0")
		("HACK"  . "#1FDA9A")
		("GOTCHA" . "#FF4500")
		("STUB"   . "#1E90FF"))))



;; TODO
;; FIXME
;; DEBUG
;; HACK

;; (use-package magit
;; 	:defer 1
;; 	:commands magit-status
;; 	:custom
;; 	(magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; REST Client
(use-package restclient
  :mode ((rx ".http" eos) . restclient-mode)
  :bind
  (:map restclient-mode-map
   ([remap restclient-http-send-current]
    . restclient-http-send-current-stay-in-window)
   ("C-n" . restclient-jump-next)
   ("C-p" . restclient-jump-prev))
  :hook
  (restclient-mode . display-line-numbers-mode))



(provide 'init-dev)
