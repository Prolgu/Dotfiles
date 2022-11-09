
;; (defun mpc-load-play (args)
;; 	"Permite cargar la lista de canciones en MPC"
;; 	(interactive "sIngrese ->")
;; 	(start-process-shell-command "mpc-load" nil (concat "mpc load " args )))
;; 							   ;; (message (concat "mload " args)))
;;   ;; (start-process-shell-command "mplay" nil "mplay"))

;; (defun mpc-play ()
;; 	"Comienza a reproducir la lista de mpc"
;; 	(interactive)
;; 	(start-process-shell-command "mpc-play" nil "mpc play"))

;; (defun mpc-volumen (args)
;;   "docstring"
;;   (interactive "sVolumen -> ")
;;   (start-process-shell-command "mpc-vol" nil (concat "mpc volume " args )))

;; (defun mpc-next ()
;; 	"docstring"
;; 	(interactive)
;; 	(start-process-shell-command "mpc-next" nil "mpc next"))
 
;; (defun mpc-prev ()
;; 	"docstring"
;; 	(interactive)
;; 	(start-process-shell-command "mpc-prev" nil "mpc prev"))

(defun mpc-status (args)
	"Devuelve el nombre de la banda y el tema que esta sonando"
	(interactive "P")
		(setq my_shell_output
		(substring 
			(shell-command-to-string "echo -e \$(mpc status|head -1)") 0 -1))
			(message my_shell_output))

(defun mpc-status-notify ()
	(interactive)
		(start-process-shell-command "notify-band" nil "~/.scripts/notify-mpc-song.sh"))
			;; (start-process-shell-command "notify-band" nil "notify-send \"$(mpc status|head -1)\""))

;; band-add-long 
(defun band-add-long()
	"Agrega la cancion y la banda que estan sonando al archivo lista-bandas"
	(interactive)
	(start-process-shell-command "band-add" nil "band-add-long"))

;; screenshot
(defun screenshot()
	"Invoca flameshot para tomar un screen"
	(setq gui "gui")
	(interactive)
	;; (start-process-shell-command "flameshot" nil (concat "flameshot " gui))
	(start-process-shell-command "flameshot" nil "flameshot gui")
	)

(defun screenshot-svg ()
  "Save a screenshot of the current frame as an SVG image.
Saves to a temp file and puts the filename in the kill ring."
  (interactive)
  (let* ((filename (format-time-string "~/Imágenes/%Y-%m-%d-%H-%M-%S.svg"))
         (data (x-export-frames nil 'svg)))
    (with-temp-file filename
      (insert data))
    (kill-new filename)
    (message filename)))
(global-set-key (kbd "C-c s") #'screenshot-svg)


;; 
(defun reboot-emacs-server()
	"Reinicia el servidor de emacs con systemd"
	(interactive)
	(start-process-shell-command "reboot-sysd" nil "systemctl --user restart emacs.service"))


(provide 'init-functions)
