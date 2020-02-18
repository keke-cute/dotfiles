;; 加载外部配置文件夹
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/config/")

;; 初始化 straight.el 插件管理
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; 预下载基础包
(straight-use-package 'use-package)
(straight-use-package 'haskell-mode)

;; 加载外部的配置文件
(require 'pyim)
(require 'basic)
(require 'package)
(put 'upcase-region 'disabled nil)
