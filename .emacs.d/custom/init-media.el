
;; Funciones personales
;; term-other-frame
;; (defun term-other-frame ()
;; 	"Abre Vterm en otro frame."
;; 	(interactive)
;; 	(let ((buf (vterm)))
;; 		(switch-to-buffer (other-buffer buf))
;; 		(switch-to-buffer-other-frame buf)))




(use-package pdf-tools
  ;; :if my-laptop-p
  :config
  (pdf-tools-install)
  (setq pdf-view-resize-factor 1.25)
  (setq-default pdf-view-display-size 'fit-page))



(use-package elfeed
  	;; :straight t
	:custom
	(elfeed-feeds
	'(
		;;dev.to
		"http://dev.to/feed"
		;;reddit
		"http://reddit.com/r/cpp/.rss"
		"http://reddit.com/r/emacs/.rss"
		"http://reddit.com/r/rust/.rss"
)))



;; radio
(use-package eradio
  ;; :straight t
	:config
	(setq eradio-channels '(
		("Caprice - Death" . "http://79.120.77.11:8002/deathmetal")
		("Caprice - MeloDeath" . "http://79.120.77.11:8002/melodicdeath")
		("Caprice - Technical Death" . "http://79.120.77.11:8002/techdeathmetal")
		("Caprice - Death Doom" . "http://79.120.39.202:8002/deathdoom")
		("Caprice - Black Death" . "http://79.111.14.76:8002/blackdeath")
		("Caprice - Black" . "http://79.120.77.11:8002/blackmetal")
		("Caprice - Symphonic Black" . "http://79.111.119.111:8002/symphonicblackmetal")
		("Caprice - DSBM" . "http://79.111.119.111:8002/dsbm")
		("Caprice - Funeral Doom" . "http://79.120.77.11:8002/funeraldoom")
		("Caprice - Doom" . "http://79.111.14.76:8002/doom")
		("Caprice - Drone Doom" . "http://79.120.39.202:8002/dronemetal")
		("Caprice - Sludge" . "http://79.120.77.11:8002/sludgemetal")
		("Caprice - Post Metal" . "http://79.120.39.202:8002/postmetal")
		("Soma FM - Metal"   . "https://somafm.com/metal130.pls")           ;; \m/
)))

(use-package simple-mpc)



(provide 'init-media)
