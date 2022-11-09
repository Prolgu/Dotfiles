;; 
(require 'prog-mode
	:config
	(add-hook 'before-save-hook (lambda ()  #'lsp-format-buffer))
	)

;; (add-hook 'prog-mode-hook  (lambda () 'before-save-hook #'lsp-format-buffer))


(use-package cc-mode
	:config
	(add-hook 'cc-mode-hook #'tree-sitter-mode)
	;; (add-hook 'before-save-hook #'lsp-format-buffer)
    (add-to-list 'c-mode-common-hook
      (lambda () (setq c-syntactic-indentation nil)))
	:bind
	(:map c-mode-map
			("C-i" . company-indent-or-complete-common)
			:map c++-mode-map
			("C-i" . company-indent-or-complete-common))
	:init
	(setq-default c-basic-offset 4))


(use-package rust-mode
	:mode "\\.rs\\'"
	:config
	(setq rust-format-on-save t)
	;; (add-hook 'rust-mode-hook #'cargo-minor-mode)
	:hook
	(rust-mode . cargo-minor-mode))

(use-package cargo
	:hook
	(rust-mode . cargo-minor-mode)
	:custom
	(lsp-rust-server 'rust-analyzer))

(use-package toml-mode
  :mode "\\.toml\\'")

(use-package racer
	:after (rust-mode)
	:config
		(add-hook 'rust-mode-hook #'racer-mode)
		(add-hook 'racer-mode-hook #'eldoc-mode)
		(add-hook 'racer-mode-hook #'company-mode)
		(define-key rust-mode-map (kbd "<tab>") #'company-indent-or-complete-common)
		(setq company-tooltip-align-annotations t)
		(setq racer-loaded 1))

(use-package tree-sitter
  :config

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
  ;; :hook
  ;; (prog-mode . (lambda ()
  ;; 					   (unless (derived-mode-p 'emacs-lisp-mode)
  ;; 							(add-hook 'prog-mode-hook
  ;; 							(lambda ()
  ;; 								(require 'tree-sitter)
  ;; 								(require 'tree-sitter-langs)
  ;; 								(require 'tree-sitter-hl)
  ;; 								(tree-sitter-hl-mode))
  ;; 			 ))))

  ;; (C-mode . (lambda () (require 'tree-sitter)
  ;; 						(require 'tree-sitter-langs)
  ;; 						(require 'tree-sitter-hl)
  ;; 						(tree-sitter-hl-mode)))
			 
  ;; (C++-mode . (lambda () (require 'tree-sitter)
  ;; 						(require 'tree-sitter-langs)
  ;; 						(require 'tree-sitter-hl)
  ;; 						(tree-sitter-hl-mode)))
  )

(use-package flymake
	:custom
		(flymake-fringe-indicator-position 'left-fringe))

(use-package rainbow-delimiters
	:hook
		(prog-mode . (lambda ()
					   (rainbow-delimiters-mode-enable)))
		;; (emacs-lisp-mode . (lambda ()
		;; 			   (rainbow-delimiters-mode-enable)))
		)



(provide 'init-prog-modes)
