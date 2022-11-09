;; Matt_Mjolner emacs config

;; Startup Time 
(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                     (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)

;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; data
(setq user-full-name "Matt Mjolner"
	user-mail-address "mjolner_@hotmail.com")


;; (let ((normal-gc-cons-threshold (* 20 1024 1024))
;;       (init-gc-cons-threshold (* 128 1024 1024)))
;;   (setq gc-cons-threshold init-gc-cons-threshold)
;;   (add-hook 'emacs-startup-hook
;;             (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

;; Initialize package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")
						 ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package) (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


;; auto update
(use-package auto-package-update
  :custom
  ;; (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update nil)
  (auto-package-update-hide-results t)
  :config
	(setq auto-package-update-delete-old-versions t)
	;; (auto-package-update-at-time "09:00")
	;; (auto-package-update-maybe)
	)


;; NOTE: If you want to move everything out of the ~/.emacs.d folder
;; reliably, set `user-emacs-directory` before loading no-littering!
;; (setq user-emacs-directory "~/.cache/emacs")

(use-package no-littering)

;; no-littering doesn't set this by default so we must place
;; auto save: files in the same path as it uses for sessions
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
(setq backup-directory-alist
	  `(("." . ,(concat user-emacs-directory "backups"))))

(add-to-list 'load-path "~/.emacs.d/custom/")


(use-package command-log-mode
	:commands command-log-mode)


;; (setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp
;;     projectile hydra flycheck company avy which-key helm-xref dap-mode))

;; (when (cl-find-if-not #'package-installed-p package-selected-packages)
;;   (package-refresh-contents)
;;   (mapc #'package-install package-selected-packages))



(use-package which-key
	:defer 0
	:diminish which-key-mode
	:config
	(which-key-mode)
	(setq which-key-idle-delay 1))


(use-package helpful
	:commands (helpful-callable helpful-variable helpful-command helpful-key)
	:custom
	(counsel-describe-function-function #'helpful-callable)
	(counsel-describe-variable-function #'helpful-variable)
	:bind
	([remap describe-function] . counsel-describe-function)
	([remap describe-command] . helpful-command)
	([remap describe-variable] . counsel-describe-variable)
	([remap describe-key] . helpful-key))


(use-package flycheck
	:defer)

(with-eval-after-load 'treemacs
	(define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))


(use-package yasnippet
	:config (yas-global-mode 1)
	:hook
	(prog-mode . yas-minor-mode))

(use-package yasnippet-snippets
	;; :defer 0
	:after yas)

;; (add-hook 'prog-mode-hook #'yas-minor-mode)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))      ;; personal snippets

(with-eval-after-load 'lsp-mode
	(add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
	;; (require 'dap-cpptools)
	(yas-global-mode 1))

(add-hook 'yas-minor-mode-hook
		  (lambda () (yas-activate-extra-mode 'fundamental-mode)))

;; (use-package eaf
;;   :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
;;   :custom
;;   ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
;;   (eaf-browser-continue-where-left-off t)
;;   (eaf-browser-enable-adblocker t)
;;   (browse-url-browser-function 'eaf-open-browser)
;;   :config
;;   (defalias 'browse-web #'eaf-open-browser)
;;   ;; (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
;;   ;; (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
;;   ;; (eaf-bind-key take_photo "p" eaf-camera-keybinding)
;;   ;; (eaf-bind-key nil "M-q" eaf-browser-keybinding)

;;   ) ;; unbind, see more in the Wiki
;; (require 'eaf-browser)
;; (require 'eaf-pdf-viewer)





(require 'init-ui)
(require 'init-custom)
(require 'init-evil)
(require 'init-dev)
(require 'init-helm)
(require 'init-lsp)
(require 'init-company)
(require 'init-shell)
(require 'init-org)
(require 'init-dired)
(require 'init-spell-check)
(require 'init-prog-modes)
(require 'init-media)
(require 'init-functions)
;; (require 'init-pdf)


;; store custom-file separately, don't freak out when it's not found.
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))

