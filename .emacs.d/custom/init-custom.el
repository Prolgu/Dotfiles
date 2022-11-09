
(setq recentf-max-menu-items 25   	;; recentf max menu 25
	  recentf-max-saved-items 25  	;; recentf max save 25
	  save-place-file "~/.emacs.d/saveplace" ;; saveplace
	  visible-bell nil   			;; Set up the visible bell
	  ring-bell-function 'ignore 	;; Disable annoying ring-bell when backspace key is pressed in certain situations
	  ;; split-height-threshold nil ;; las pantallas al costado
	  ;; split-width-threshold 0    ;; las pantallas al costado
	  ;; next-line-add-newlines t   ;; crea nuevas lineas al llegar al final
	  inhibit-startup-message t 	;; No message on startup
	  cursor-in-non-selected-windows nil     ; Hide the cursor in inactive windows
	  confirm-kill-processes nil 	;; Exit without confirm kill process
	  org-confirm-babel-evaluate nil
   	  org-src-fontify-natively t
	  org-src-tab-acts-natively t
	  org-hide-emphasis-markers t
	  initial-major-mode 'emacs-lisp-mode ;; Modo del scratch
	  initial-scratch-message ";; C-x C-f -> Visitar archivo.\n\n";; Mensaje del scratch

	  display-line-numbers-type 'relative) ;; Relative mode


(blink-cursor-mode -1)
(scroll-bar-mode -1)        ;; Disable scrollbar
(tool-bar-mode -1)          ;; Disable toolbar
(tooltip-mode -1)           ;; Disable tooltips
;; (set-fringe-mode 10)        ;; Give some breathing room
(menu-bar-mode -1)          ;; Disable menu bar
(save-place-mode 1)         ;; Remember cursor position
;; (global-hl-line-mode 1)     ;; Global HL Line 
(show-paren-mode 1) 		;; Highlight matching brackets and braces
(electric-pair-mode 1) 		;; Automatically add ending brackets and braces
(display-battery-mode 1) 	;; Muestra estado de bateria
;; (set-language-environment "utf-8") ;; Codificacion
;; (set-default-coding-systems 'utf-8) ;; Codificacion

(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))
;; start in org-mode with a source block for lisp evaluation
;; (setq initial-major-mode #'org-mode
;;       initial-scratch-message "#+begin_src emacs-lisp\n;; C-x C-f -> Visitar archivo.\n\n\n#+end_src\n\n")

(recentf-mode 1)			;; Recentf-mode 
(column-number-mode)
;; (setq menu-bar--display-line-numbers-mode-relative t)
;; (global-display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'emacs-lisp-mode-hook  (lambda () display-line-numbers-mode))
(add-hook 'find-file-hook 'recentf-save-list)

;; (add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)
;; (add-hook 'eval-expression-minibuffer-setup-hook #'paredit-mode)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
				vterm-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Coding specific setting++
(setq-default tab-width 4 		;; Make sure tab-width is 4 and not 8
			  cursor-type 'box	;; Cursor Shape
			  truncate-lines 0) 


(defalias 'yes-or-no-p 'y-or-n-p)


;; unsets
(global-unset-key (kbd "C-x f"))

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;; Kill current buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)
;; Keybind para mover entre buffers
(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "M-]") 'next-buffer)
;; eval key
(global-set-key (kbd "C-c b") 'eval-buffer)

;;keybind para abrir terminal en frame
;; (global-set-key (kbd "C-c C-t") 'term-other-frame)
;; (global-set-key (kbd "C-x C-!")
;; 				(lambda () (interactive) (other-frame-prefix) (vterm)))


(global-set-key (kbd "C-c r p") 'eradio-play)
(global-set-key (kbd "C-c r t") 'eradio-toggle)



(provide 'init-custom)
