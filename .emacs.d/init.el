;;可可酱的EMACS配置文件

;;MELPA软件源设定
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;;插件管理
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (telega yasnippet-snippets yasnippet flycheck smex expand-region company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)
;; 关闭文件滑动控件
(scroll-bar-mode -1)
;; 显示行号
(global-linum-mode 1)
;; 更改光标的样式
(setq-default cursor-type 'bar)
;; 关闭备份
(setq make-backup-files nil)
;; set a default font
(when (member "Cascadia Code" (font-family-list))
  (set-face-attribute 'default nil :font "Cascadia Code-10"))
;;company 补全插件相关设定 自动完成输入, 支持各种语言和后端
(add-hook 'after-init-hook 'global-company-mode)
;;expand-region 区域选择插件相关设定 快捷键选中文本, 可将选择区域伸缩
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
;;smex 补全命令相关设定 让输入命令变得飞快
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;;flycheck 语法检查 对不同语言做语法检查
(global-flycheck-mode)
;;开启yasnippet 强大的文本模板输入工具
(yas-global-mode 1)
;;Telega
(add-to-list 'load-path "~/telega.el")
(require 'telega)
;;主题配置
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme `wilmersdorf t)
