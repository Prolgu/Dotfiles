
;; You will most likely need to adjust this font size for your system!
(defvar efs/default-font-size 130)
(defvar efs/default-variable-font-size 130)
;; Make frame transparency overridable
;; (defvar efs/frame-transparency '(80 . 80))
;; (defvar doom-modeline-icon (display-graphic-p))

;; Set frame transparency
;; (set-frame-parameter (selected-frame) 'alpha efs/frame-transparency)
;; (add-to-list 'default-frame-alist `(alpha . ,efs/frame-transparency))
;; (set-frame-parameter (selected-frame) 'fullscreen 'maximized)
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))
;; (use-package no-easy-keys)

;; doom-theme
(use-package doom-themes
  ;; :init (load-theme 'doom-dracula t)
  :config
  (setq doom-dracula-brighter-comments nil
		doom-dracula-brighter-modeline nil))

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :init
  (unless after-init-time
    ;; prevent flash of unstyled modeline at startup
    (setq-default mode-line-format t))
  ;; We display project info in the modeline ourselves
  (setq projectile-dynamic-mode-line t)

  ;; Fix modeline icons in daemon-spawned graphical frames. We have our own
  ;; mechanism for disabling all-the-icons, so we don't need doom-modeline to do
  ;; it for us. However, this may cause unwanted padding in the modeline in
  ;; daemon-spawned terminal frames. If it bothers you, you may prefer
  ;; `doom-modeline-icon' set to `nil'.
  ;; (when (daemonp)
  ;;   (setq doom-modeline-icon nil))
  :config
  ;; Set these early so they don't trigger variable watchers
  (setq doom-modeline-bar-width 3
		doom-modeline-time-icon nil
		doom-modeline-icon nil 
		;; doom-modeline-buffer-state-icon nil
		;; doom-modeline--buffer-file-icon nil
		;; doom-modeline-buffer-modification-icon nil
		doom-modeline-major-mode-icon nil
        doom-modeline-github nil
        doom-modeline-mu4e nil
        doom-modeline-persp-name nil
        doom-modeline-minor-modes nil
        doom-modeline-major-mode-icon nil
        doom-modeline-buffer-file-name-style 'relative-from-project)
	;; Fix an issue where these two variables aren't defined in TTY Emacs on MacOS
	(defvar mouse-wheel-down-event nil)
	(defvar mouse-wheel-up-event nil)
	;; Remove unused segments & extra padding
	(doom-modeline-def-modeline 'main
		'(window-number modals matches "  " buffer-info  remote-host selection-info)
		'(objed-state misc-info persp-name major-mode " " github debug battery "   "))

	(doom-modeline-def-modeline 'minimal
		'(bar matches buffer-info-simple)
		'(media-info major-mode))

	(doom-modeline-def-modeline 'pdf-view-mode
		'(bar matches buffer-info-simple)
		'(media-info major-mode))

	(doom-modeline-def-modeline 'special
		'(bar window-number matches buffer-info-simple selection-info)
		'(objed-state misc-info persp-name debug input-method lsp major-mode process checker battery "  "))

	(doom-modeline-def-modeline 'project
		'(window-number buffer-default-directory)
		'(misc-info mu4e github debug battery  " " major-mode process battery "  "))

	(doom-modeline-def-modeline 'helm
		'(helm-buffer-id helm-number helm-follow helm-prefix-argument)
		'(helm-help))

	(doom-modeline-def-modeline 'vterm
		'(media-info major-mode))

  )

  ;; (add-hook 'doom-modeline-mode-hook #'size-indication-mode) ; filesize in modeline
  ;; (add-hook 'doom-modeline-mode-hook #'column-number-mode)   ; cursor column in modeline

  (add-hook 'doom-change-font-size-hook #'+modeline|resize-for-font)
  (add-hook 'doom-load-theme-hook #'doom-modeline-refresh-bars)

  ;; (add-hook '+doom-dashboard-mode-hook #'doom-modeline-set-project-modeline)

(use-package hide-mode-line)

(defun +modeline|hide-in-non-status-buffer ()
"Show minimal modeline in magit-status buffer, no modeline elsewhere."
(if (eq major-mode 'magit-status-mode)
	(doom-modeline-set-project-modeline)
	(hide-mode-line-mode)))

(add-hook 'magit-mode-hook #'+modeline|hide-in-non-status-buffer)
;; (add-hook 'vterm-mode-hook #'+modeline|hide-in-non-status-buffer)
(add-hook 'pdf-view-mode-hook #'hide-mode-line-mode)



;; Some functions modify the buffer, causing the modeline to show a false
;; modified state, so we try to force them to behave.
(defun +modeline*inhibit-modification-hooks (orig-fn &rest args)
	(with-silent-modifications (apply orig-fn args)))
(advice-add #'ws-butler-after-save :around #'+modeline*inhibit-modification-hooks)

(defun efs/set-font-faces ()
  (message "Setting faces!")
  (set-face-attribute 'default nil :font "JetBrainsMonoMedium Nerd Font" :height efs/default-font-size)
  ;; Set the fixed pitch face
  (set-face-attribute 'fixed-pitch nil :font "JetBrainsMonoMedium Nerd Font" :height efs/default-font-size)
  ;; Set the variable pitch face
  (set-face-attribute 'variable-pitch nil :font "JetBrainsMonoMedium Nerd Font" :height efs/default-variable-font-size :weight 'regular))

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (setq doom-modeline-icon nil)
                (with-selected-frame frame
                  (efs/set-font-faces)
				  (load-theme 'doom-dracula t))))
  (efs/set-font-faces)
  (load-theme 'doom-dracula t))

;; Mantiene el color del cursor en daemon-mode
(require 'frame)
	(defun set-cursor-hook (frame)
	(modify-frame-parameters
		frame (list (cons 'cursor-color "DeepSkyBlue"))))
(add-hook 'after-make-frame-functions 'set-cursor-hook)

(set-cursor-color "DeepSkyBlue")


;; (use-package hl-line)
(add-hook 'prog-mode-hook #'hl-line-mode)
(add-hook 'text-mode-hook #'hl-line-mode)

;; (add-hook 'vterm-mode-hook (lambda () (setq-local global-hl-line-mode nil)))
;; (add-hook 'org-mode-hook (lambda () (setq-local global-hl-line-mode nil)))

(use-package highlight-indent-guides
	:config
	(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
	(setq highlight-indent-guides-method 'character
		  highlight-indent-guides-responsive 'top))





(provide 'init-ui)
