
;; (defun efs/org-font-setup ()
;; ;; Replace list hyphen with dot
;;   (font-lock-add-keywords 'org-mode
;;                           '(("^ *\\([-]\\) "
;;                              (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;; ;; Set faces for heading levels
;;   (dolist (face '((org-level-1 . 1.5)
;;                   (org-level-2 . 1.4)
;;                   (org-level-3 . 1.3)
;;                   (org-level-4 . 1.0)
;;                   (org-level-5 . 1.0)
;;                   (org-level-6 . 1.0)
;;                   (org-level-7 . 1.0)
;;                   (org-level-8 . 1.0)))
;;     (set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))

;; (custom-theme-set-faces 'user
;;                         `(org-level-1 ((t (:foreground "red")))))


;; (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch))


;; (setq org-confirm-babel-evaluate nil
;;    	  org-src-fontify-natively t
;; 	  org-src-tab-acts-natively t)

;; (setq org-hide-emphasis-markers t)
;; (setq org-ellipsis " [+]")

(defun my/org-custom ()
	(let* ((variable-tuple
			(cond
			;; ((x-list-fonts "iMWritingDuoS Nerd Font")   '(:family "iMWritingDuoS Nerd Font"))
			((x-list-fonts "Georgia")   '(:family "Georgia"))
			((x-list-fonts "PT Serif")  '(:family "PT Serif"))))
		(fixed-tuple
			(cond
			;; ((x-list-fonts "iMWritingDuoS Nerd Font Mono")   '(:family "iMWritingDuoS Nerd Font Mono"   :height 160))
			((x-list-fonts "Menlo")               '(:family "Menlo"    :height 120))
			((x-list-fonts "PT Mono")             '(:family "PT Mono"  :height 120))))
		(headline `(:inherit default :weight bold))
		)
	(custom-theme-set-faces
	'user
	`(org-level-1 ((t (,@headline ,@variable-tuple :height 1.35 :foreground "gainsboro" ))))
	`(org-level-2 ((t (,@headline ,@variable-tuple :height 1.15  :foreground "MediumPurple1" ))))
	`(org-level-3 ((t (,@headline ,@variable-tuple :height 1.05 :foreground "DeepSkyBlue" ))))
	`(org-level-4 ((t (,@headline ,@variable-tuple  ))))
	`(org-level-5 ((t (,@headline ,@variable-tuple ))))
	`(org-level-6 ((t (,@headline ,@variable-tuple ))))
	`(org-level-7 ((t (,@headline ,@variable-tuple ))))
	`(org-level-8 ((t (,@headline ,@variable-tuple ))))
	`(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :foreground "gold" :underline nil))))

	`(variable-pitch     ((t ,@variable-tuple)))
	`(fixed-pitch        ((t ,@fixed-tuple)))

	;; '(org-ellipsis ((t (:inherit fixed-pitch :foreground "gray40" :underline nil))))
	'(org-ellipsis ((t (:inherit fixed-pitch :foreground "DeepSkyBlue" :underline nil))))
	;; '(org-block            ((t (:inherit fixed-pitch :foreground "DimGray"))))
	;; '(org-block-begin-line ((t (:inherit fixed-pitch :foreground "DimGray"))))
	;; '(org-block-end-line   ((t (:inherit fixed-pitch :foreground "DimGray"))))
	;; '(org-src              ((t (:inherit fixed-pitch :foreground "DimGray"))))
	'(org-properties       ((t (:inherit fixed-pitch))))
	;; '(org-code             ((t (:inherit (shadow fixed-pitch)))))
	'(org-date             ((t (:inherit (shadow fixed-pitch)))))
	'(org-document-info    ((t (:inherit (shadow fixed-pitch)))))
	'(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
	'(org-drawer           ((t (:inherit (shadow fixed-pitch)))))
	'(org-indent           ((t (:inherit (org-hide fixed-pitch)))))
	`(org-link             ((t (:inherit fixed-pitch :foreground ,(doom-color 'blue) :underline t))))
	'(org-meta-line        ((t (:inherit (font-lock-comment-face fixed-pitch)))))
	'(org-property-value   ((t (:inherit fixed-pitch))) t)
	'(org-special-keyword  ((t (:inherit (font-lock-comment-face fixed-pitch)))))
	'(org-table            ((t (:inherit fixed-pitch))))
	'(org-tag              ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
	'(org-verbatim         ((t (:inherit (shadow fixed-pitch)))))))
)


;; (defun efs/org-mode-setup ()
	;; (variable-pitch-mode 1)
	;; (visual-line-mode 1)
	;; (org-indent-mode))

(use-package org
	:pin org
	;; :commands (org-capture org-agenda)
	:hook
	;; (org-mode . efs/org-mode-setup)
	(org-mode . my/org-custom)
	(org-mode . variable-pitch-mode)

	:config
	(setq org-ellipsis " ▾")
	(org-indent-mode)
	; (setq org-agenda-start-with-log-mode t)
	;; (efs/org-font-setup)
	(setq org-log-done 'time)
	(setq org-log-into-drawer t))

(use-package org-bullets
	;; :defer t
	:hook
	(org-mode . org-bullets-mode)
	:custom
	(org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●"))
	(org-ellipsis "⤵"))


(defun efs/org-mode-visual-fill ()
	(setq visual-fill-column-width 100
		visual-fill-column-center-text t)
	(visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook
  (org-mode . efs/org-mode-visual-fill)
  (markdown-mode . efs/org-mode-visual-fill))

(use-package markdown-mode
  :init
  (setq-default markdown-hide-markup t))

(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (add-hook 'evil-org-mode-hook
        (lambda () (evil-org-set-key-theme)))
  ;; (require 'evil-org-agenda)
  ;; (evil-org-agenda-set-keys)
  )



 ;; (with-eval-after-load 'org
 ;;   ;; This is needed as of Org 9.2
 ;;   (require 'org-tempo)

(org-babel-do-load-languages
	'org-babel-load-languages
	'((calc .t)
	(C . t)
	(org . t)
	;; (C++ . t)
	(emacs-lisp . t)
	;; (rust . t)
	;; (sql . t)
	(python . t)
	(shell . t)
	(lilypond . t)
	;; (restclient . t)
 ))

 ;;   (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
 ;;   (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
 ;;   (add-to-list 'org-structure-template-alist '("py" . "src python")))

(provide 'init-org)
