
(defun efs/lsp-mode-setup ()
	(setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
	(lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
	:commands (lsp lsp-deferred)
	;; :hook (lsp-mode . efs/lsp-mode-setup)
	:hook ((c-mode          ; clangd
			c++-mode        ; clangd
			c-or-c++-mode   ; clangd
			python-mode     ; pyright
			rust-mode
			) . lsp-deferred)
	:init
		(setq lsp-keymap-prefix "C-c C-l")  ;; Or 'C-l', 's-l'
	:config
		(setq lsp-enable-snippet t
			lsp-auto-guess-root t
			lsp-log-io nil
			lsp-restart 'auto-restart
			lsp-enable-symbol-highlighting nil
			lsp-enable-on-type-formatting nil
			lsp-signature-auto-activate nil
			lsp-signature-render-documentation nil
			lsp-eldoc-hook nil
			lsp-modeline-code-actions-enable nil
			lsp-modeline-diagnostics-enable t
			lsp-headerline-breadcrumb-enable t
			lsp-semantic-tokens-enable nil
			lsp-enable-folding nil
			lsp-enable-imenu t
			lsp-enable-which-key-integration t
			read-process-output-max (* 1024 1024) ;; 1MB
			lsp-idle-delay 0.2))

(global-set-key (kbd "C-c f b") 'lsp-format-buffer)
;; (add-hook 'before-save-hook #'lsp-format-buffer)
(setq lsp-completion-provider :none)

(use-package lsp-ui
	:hook (lsp-mode . lsp-ui-mode)
	:custom
	(lsp-ui-doc-position 'bottom))

(use-package lsp-treemacs
	:after treemacs lsp 
	:custom
	(treemacs-load-all-the-icons-with-workaround-font "Hermit"))

(use-package lsp-pyright
	:hook (python-mode . (lambda () (require 'lsp-pyright)))
	:init (when (executable-find "python3")
			(setq lsp-pyright-python-executable-cmd "python3")))

(provide 'init-lsp)
