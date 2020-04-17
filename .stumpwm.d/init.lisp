;; -*-lisp-*-
;;
;;    _        _                _                                                _ 
;;   | |      | |              | |                                              | |
;;   | | _____| | _____     ___| |_ _   _ _ __ ___  _ ____      ___ __ ___    __| |
;;   | |/ / _ \ |/ / _ \   / __| __| | | | '_ ` _ \| '_ \ \ /\ / / '_ ` _ \  / _` |
;;   |   <  __/   <  __/  _\__ \ |_| |_| | | | | | | |_) \ V  V /| | | | | || (_| |
;;   |_|\_\___|_|\_\___| (_)___/\__|\__,_|_| |_| |_| .__/ \_/\_/ |_| |_| |_(_)__,_|
;;                                                 | |                             
;;                                                 |_|                             

(in-package :stumpwm)

(setf *mouse-focus-policy* :click)
(setf *mode-line-timeout* 1)
(setf *window-border-style* :none)
(setf *window-format* "%m%n%s%c")
(setf *resize-increment* 30)
(setf *maxsize-border-width*   0
      *transient-border-width* 0
      *normal-border-width*    0)

;; color-scheme
(defparameter white   "#b3b1ad")
(defparameter red     "#f07178")
(defparameter yellow  "#ffb454")
(defparameter green   "#c2d94c")
(defparameter cyan    "#39bae6")
(defparameter blue    "#59c2ff")
(defparameter magenta "#f29668")
(defparameter bg      "#0a0e14")
;; color
(setf *colors* (list bg red green yellow blue magenta cyan white))

(defun my/update-color-map (screen)
  "my update-color-map, set -0.25 to 0 for the normal color."
  (labels ((map-colors (amt)
             (loop for c in *colors*
                   as color = (lookup-color screen c)
                   do (adjust-color color amt)
                   collect (alloc-color screen color))))
    (setf (screen-color-map-normal screen) (apply #'vector (map-colors 0))
          (screen-color-map-bright screen) (apply #'vector (map-colors 0.25)))))
(my/update-color-map (current-screen))

;;commands
(run-shell-command "feh --bg-fill ~/Downloads/wall.jpg")
(run-shell-command "start-pulseaudio-x11")
(run-shell-command "fcitx5")
(run-shell-command "picom")
(run-shell-command "st")
;;terminal
(defparameter *terminal* "st")
(defparameter *terminal-class* "st")
(defcommand terminal () ()
  (run-shell-command *terminal*))

;;modeline
(stumpwm:toggle-mode-line (stumpwm:current-screen)
                          (stumpwm:current-head))
(setf *screen-mode-line-format* "%n %W %d")
(load-module "stumptray")
(when *initializing*
  (grename "Main")
  (gnewbg "Other")
  (stumptray:stumptray))
(setf *mode-line-background-color* bg)
(setf *mode-line-foreground-color* white)
(setf *mode-line-border-color* bg)
(setf stumptray:*tray-viwin-background* bg)


;; message
(set-bg-color bg)
(set-fg-color blue)
(set-border-color bg)

;; key binding
(defun defkey (map key cmd)
  (define-key map (kbd key) cmd))
(defun defkeys (map binds)
  (dolist (bind binds)
    (defkey map (car bind) (cadr bind))))
(defkeys *root-map*
  '(    ("c" "terminal")))






