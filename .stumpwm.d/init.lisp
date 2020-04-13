;;(run-shell-command "feh --bg-fill ~/Downloads/wall.jpg")
;;(run-shell-command "start-pulseaudio-x11")
;;(run-shell-command "fcitx5")

(defparameter *terminal* "st")
(defparameter *terminal-class* "st")

(defcommand terminal () ()
  (run-shell-command *terminal*))
  
(stumpwm:toggle-mode-line (stumpwm:current-screen)
                          (stumpwm:current-head))
(setf *screen-mode-line-format* "%n %W %d")

(defun defkey (map key cmd)
  (define-key map (kbd key) cmd))
(defun defkeys (map binds)
  (dolist (bind binds)
    (defkey map (car bind) (cadr bind))))
(defkeys *root-map*
  '(    ("c" "terminal")))

;;(load-module "stumptray")
;;(stumptray::stumptray)
