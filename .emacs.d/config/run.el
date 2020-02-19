(defvar keke-run-current-file-before-hook nil "Hook for `keke-run-current-file'. Before the file is run.")

(defvar keke-run-current-file-after-hook nil "Hook for `keke-run-current-file'. After the file is run.")

(defun keke-run-current-file ()
  (interactive)
  (let (
	($outputb "*keke-run output*")
	(resize-mini-windows nil)
	($suffix-map
	 `(
	   ("ts" . "node")
	   ("html" . "firefox-bin")
	   ))
	   $fname
	   $fSuffix
	   $prog-name
	   $cmd-str)
	 (when (not (buffer-file-name)) (save-buffer))
	 (when (buffer-modified-p) (save-buffer))
	 (setq $fname (buffer-file-name))
	 (setq $fSuffix (file-name-extension $fname))
	 (setq $prog-name (cdr (assoc $fSuffix $suffix-map)))
	 (setq $cmd-str (concat $prog-name " \""   $fname "\" &"))
	 (run-hooks 'keke-run-current-file-before-hook)
	 (if $prog-name
	     (progn
	       (message "Running")
	       (shell-command $cmd-str $outputb ))
	   (error "No recognized program file suffix for this file."))))
	 (run-hooks 'keke-run-current-file-after-hook)

(provide 'run)
