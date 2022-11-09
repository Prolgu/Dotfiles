;; 
(defvar pdf-minimal-width 72
  "Minimal width of a window displaying a pdf.
If an integer, number of columns.  If a float, fraction of the
original window.")
;; 
(defvar pdf-split-width-threshold 120
  "Minimum width a window should have to split it horizontally
for displaying a pdf in the right.")
;; 
(defun pdf-split-window-sensibly (&optional window)
  "A version of `split-window-sensibly' for pdfs.
It prefers splitting horizontally, and takes `pdf-minimal-width'
into account."
  (let ((window (or window (selected-window)))
	(width (- (if (integerp pdf-minimal-width)
		      pdf-minimal-width
		    (round (* pdf-minimal-width (window-width window)))))))
    (or (and (window-splittable-p window t)
	     ;; Split window horizontally.
	     (with-selected-window window
	       (split-window-right width)))
	(and (window-splittable-p window)
	     ;; Split window vertically.
	     (with-selected-window window
	       (split-window-below)))
	(and (eq window (frame-root-window (window-frame window)))
	     (not (window-minibuffer-p window))
	     ;; If WINDOW is the only window on its frame and is not the
	     ;; minibuffer window, try to split it vertically disregarding
	     ;; the value of `split-height-threshold'.
	     (let ((split-height-threshold 0))
	       (when (window-splittable-p window)
		 (with-selected-window window
		   (split-window-below))))))))

(defun display-buffer-pop-up-window-pdf-split-horizontally (buffer alist)
  "Call `display-buffer-pop-up-window', using `pdf-split-window-sensibly'when needed."
  (let ((split-height-threshold nil)
	(split-width-threshold pdf-split-width-threshold)
	(split-window-preferred-function #'pdf-split-window-sensibly))
    (display-buffer-pop-up-window buffer alist)))

(add-to-list 'display-buffer-alist '("\\.pdf\\(<[^>]+>\\)?$" . (display-buffer-pop-up-window-pdf-split-horizontally)))

;; 
(defun md-compile ()
	"Compiles the currently loaded markdown file using pandoc into a PDF"
	(interactive)
	(save-buffer)
	(shell-command (concat "pandoc " (buffer-file-name) " -o "
							(replace-regexp-in-string "md" "pdf" (buffer-file-name)))))

(defun update-other-buffer ()
	(interactive)
	(other-window 1)
	(revert-buffer nil t)
	(other-window -1))

(defun md-compile-and-update-other-buffer ()
	"Has as a premise that it's run from a markdown-mode buffer and the
	other buffer already has the PDF open"
	(interactive)
	(md-compile)
	(update-other-buffer))

(defun latex-compile-and-update-other-buffer ()
	"Has as a premise that it's run from a latex-mode buffer and the
	other buffer already has the PDF open"
	(interactive)
	(save-buffer)
	(shell-command (concat "pdflatex " (buffer-file-name)))
	(switch-to-buffer (other-buffer))
	(kill-buffer)
	(update-other-buffer))

(defun org-compile-beamer-and-update-other-buffer ()
	"Has as a premise that it's run from an org-mode buffer and the
	other buffer already has the PDF open"
	(interactive)
	(org-beamer-export-to-pdf)
	(update-other-buffer))

(defun org-compile-latex-and-update-other-buffer ()
	"Has as a premise that it's run from an org-mode buffer and the
	other buffer already has the PDF open"
	(interactive)
	(org-latex-export-to-pdf)
	(update-other-buffer))

(eval-after-load 'latex-mode
	'(define-key latex-mode-map (kbd "C-c r") 'latex-compile-and-update-other-buffer))

(eval-after-load 'org-mode
	'(define-key org-mode-map (kbd "C-c l r") 'org-compile-latex-and-update-other-buffer))

(eval-after-load 'org-mode
	'(define-key org-mode-map (kbd "C-c b r") 'org-compile-beamer-and-update-other-buffer))

(eval-after-load 'markdown-mode
	'(define-key markdown-mode-map (kbd "C-c r") 'md-compile-and-update-other-buffer))

(provide 'init-pdf)
