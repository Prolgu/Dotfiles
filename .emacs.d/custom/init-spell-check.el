
;; correcion ortografica
;; Please note ispell-extra-args contains ACTUAL parameters passed to aspell
(setq ispell-program-name "aspell"
	  ispell-extra-args '("--sug-mode=ultra" "--lang=es_UY"))


(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

(defun flyspell-spanish ()
  (interactive)
  (ispell-change-dictionary "castellano")
  (flyspell-buffer))

(defun flyspell-english ()
  (interactive)
  (ispell-change-dictionary "default")
  (flyspell-buffer))

(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-orrect-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)))
(global-set-key (kbd "<f8>") 'flyspell-spanish)

(use-package flyspell-correct
  :after flyspell
  :bind
  ;; (:map flyspell-mode-map ("<f7>" . flyspell-correct-wrapper))
  (:map flyspell-mode-map ("<f7>" . flyspell-correct-next))
  )

(use-package flyspell-correct-helm
  :after flyspell-correct)

;; (add-hook 'org-mode-hook 'flyspell-spanish)

(provide 'init-spell-check)
