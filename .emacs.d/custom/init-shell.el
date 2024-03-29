
(use-package vterm
	:commands vterm
	:config
	;; (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")  ;; Set this to match your custom shell prompt
	(setq vterm-shell "zsh")                       ;; Set this to customize the shell to launch
	(setq vterm-max-scrollback 10000))

;; (use-package vterm-toggle)

;; (add-to-list 'display-buffer-alist
;;      '("\*vterm\*"
;;        (display-buffer-in-side-window)
;;        (window-height . 0.25)
;;        (side . bottom)
;;        (slot . 0)))

;; Vterm-toggle + size
(use-package vterm-toggle
	:bind
	(("C-c t"        . vterm-toggle)
	:map vterm-mode-map
	("<C-return>" . vterm-toggle-insert-cd))
	:config
	(add-to-list 'display-buffer-alist
		'("\*vterm\*"
		(display-buffer-in-side-window)
		(window-height . 0.35)
		(side . bottom)
		(slot . 0))))

;; (use-package term
;;   :commands term
;;   :config
;;   (setq explicit-shell-file-name "zsh")) ;; Change this to zsh, etc
  ;;(setq explicit-zsh-args '())         ;; Use 'explicit-<shell>-args for shell-specific args

  ;; Match the default Bash shell prompt.  Update this if you have a custom prompt
  ;; (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *"))

;; (use-package eterm-256color
;;   :hook (term-mode . eterm-256color-mode))

 ;; (when (eq system-type 'windows-nt)
 ;;   (setq explicit-shell-file-name "powershell.exe")
 ;;   (setq explicit-powershell.exe-args '()))

(defun efs/configure-eshell ()
	"Save command history when commands are entered"	
	(add-hook 'eshell-pre-command-hook 'eshell-save-some-history)
	;; Truncate buffer for performance
	(add-to-list 'eshell-output-filter-functions 'eshell-truncate-buffer)

  ;; Bind some useful keys for evil-mode
  ;; (evil-define-key '(normal insert visual) eshell-mode-map (kbd "C-r") 'counsel-esh-history)
  ;; (evil-define-key '(normal insert visual) eshell-mode-map (kbd "<home>") 'eshell-bol)
  ;; (evil-normalize-keymaps)

	(setq eshell-history-size 10000
		  eshell-buffer-maximum-lines 10000
		  eshell-hist-ignoredups t
		  eshell-scroll-to-bottom-on-input t))

(use-package eshell-git-prompt
	:after eshell)

(use-package eshell
	:hook (eshell-first-time-mode . efs/configure-eshell)
	:config
	(with-eval-after-load 'esh-opt
		(setq eshell-destroy-buffer-when-process-dies t)
		(setq eshell-visual-commands '("htop" "zsh" "vim")))
	(eshell-git-prompt-use-theme 'powerline))

(provide 'init-shell)
