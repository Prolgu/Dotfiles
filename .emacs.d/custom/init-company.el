
(use-package company
	:after lsp-mode
	:hook (lsp-mode . company-mode)
	:bind (:map company-active-map ("<tab>" . company-select-next))
	(:map lsp-mode-map ("<tab>" . company-indent-or-complete-common))
	:custom
	(company-minimum-prefix-length 1))

;; (use-package company-yasnippet
;;   ;; :load-path company-yasnippet-p
;;   :init
;;   ;; (require 'company-yasnippet)
;;   :commands(company-mode yas-minor-mode))


(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")

;; (setq lsp-completion-provider :capf)
(setq company-tooltip-align-annotations t
	company-idle-delay 0 	;; Trigger completion immediately.
	company-show-numbers nil 	;; Number the candidates (use M-1, M-2 etc to select completions).
	company-dabbrev-minimum-length 2
	company-dabbrev-ignore-case 'keep-prefix
	company-dabbrev-downcase nil
	company-files-exclusions '(".git/" ".DS_Store")
	company-backends '((company-capf
						:with company-yasnippet 
						company-dabbrev-code
						company-files
						company-clang)))
							;; :separate company-dabbrev-code
							;; :separate company-files)))

;; (setq company-backends '((company-capf company-dabbrev-code)))


(use-package company-fuzzy
  :after company
  ;; :commands company-fuzzy-mode
  :config
  (company-fuzzy-mode)
  (setq company-fuzzy-sorting-backend 'alphabetic)
  (setq company-fuzzy-prefix-ontop t)
  (setq company-fuzzy-show-annotation t)
  ;; (add-to-list 'company-fuzzy--no-prefix-backend 'company-yasnippet)
  )

;; (use-package company-statistics
;;   :config
;;   (company-statistics-mode))

(defun my-text-mode-hook ()
	(setq-local company-backends
				'((company-dabbrev company-ispell :separate)
					company-files)))

(add-hook 'text-mode-hook #'my-text-mode-hook)


;; (defun company-mode/backend-with-yas (backend)
;;   (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
;;       backend
;;     (append (if (consp backend) backend (list backend))
;;             '(:with company-yasnippet))))

;; (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))


;; (use-package company-tabnine)

(use-package company-box
	:hook (company-mode . company-box-mode)
  :config
  (setq company-box-show-single-candidate t
        company-box-backends-colors nil
        company-box-max-candidates 50
        company-box-icons-alist 'company-box-icons-all-the-icons))
;;         ;; Move company-box-icons--elisp to the end, because it has a catch-all
;;         ;; clause that ruins icons from other backends in elisp buffers.
;;         company-box-icons-functions
        ;; (cons #'+company-box-icons--elisp-fn
        ;;       (delq 'company-box-icons--elisp
        ;;             company-box-icons-functions))
        ;; company-box-icons-all-the-icons
        ;; (let ((all-the-icons-scale-factor 0.8))
        ;;   `((Unknown       . ,(all-the-icons-material "find_in_page"             :face 'all-the-icons-purple))
        ;;     (Text          . ,(all-the-icons-material "text_fields"              :face 'all-the-icons-green))
        ;;     (Method        . ,(all-the-icons-material "functions"                :face 'all-the-icons-red))
        ;;     (Function      . ,(all-the-icons-material "functions"                :face 'all-the-icons-red))
        ;;     (Constructor   . ,(all-the-icons-material "functions"                :face 'all-the-icons-red))
        ;;     (Field         . ,(all-the-icons-material "functions"                :face 'all-the-icons-red))
        ;;     (Variable      . ,(all-the-icons-material "adjust"                   :face 'all-the-icons-blue))
        ;;     (Class         . ,(all-the-icons-material "class"                    :face 'all-the-icons-red))
        ;;     (Interface     . ,(all-the-icons-material "settings_input_component" :face 'all-the-icons-red))
        ;;     (Module        . ,(all-the-icons-material "view_module"              :face 'all-the-icons-red))
        ;;     (Property      . ,(all-the-icons-material "settings"                 :face 'all-the-icons-red))
        ;;     (Unit          . ,(all-the-icons-material "straighten"               :face 'all-the-icons-red))
        ;;     (Value         . ,(all-the-icons-material "filter_1"                 :face 'all-the-icons-red))
        ;;     (Enum          . ,(all-the-icons-material "plus_one"                 :face 'all-the-icons-red))
        ;;     (Keyword       . ,(all-the-icons-material "filter_center_focus"      :face 'all-the-icons-red))
        ;;     (Snippet       . ,(all-the-icons-material "short_text"               :face 'all-the-icons-red))
        ;;     (Color         . ,(all-the-icons-material "color_lens"               :face 'all-the-icons-red))
        ;;     (File          . ,(all-the-icons-material "insert_drive_file"        :face 'all-the-icons-red))
        ;;     (Reference     . ,(all-the-icons-material "collections_bookmark"     :face 'all-the-icons-red))
        ;;     (Folder        . ,(all-the-icons-material "folder"                   :face 'all-the-icons-red))
        ;;     (EnumMember    . ,(all-the-icons-material "people"                   :face 'all-the-icons-red))
        ;;     (Constant      . ,(all-the-icons-material "pause_circle_filled"      :face 'all-the-icons-red))
        ;;     (Struct        . ,(all-the-icons-material "streetview"               :face 'all-the-icons-red))
        ;;     (Event         . ,(all-the-icons-material "event"                    :face 'all-the-icons-red))
        ;;     (Operator      . ,(all-the-icons-material "control_point"            :face 'all-the-icons-red))
        ;;     (TypeParameter . ,(all-the-icons-material "class"                    :face 'all-the-icons-red))
        ;;     (Template      . ,(all-the-icons-material "short_text"               :face 'all-the-icons-green))
        ;;     (ElispFunction . ,(all-the-icons-material "functions"                :face 'all-the-icons-red))
        ;;     (ElispVariable . ,(all-the-icons-material "check_circle"             :face 'all-the-icons-blue))
        ;;     (ElispFeature  . ,(all-the-icons-material "stars"                    :face 'all-the-icons-orange))
        ;;     (ElispFace     . ,(all-the-icons-material "format_paint"             :face 'all-the-icons-pink)))))

(add-hook 'after-init-hook 'global-company-mode)



(provide 'init-company)
