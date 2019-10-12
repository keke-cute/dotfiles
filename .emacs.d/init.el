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
    (markdown-mode yasnippet-snippets yasnippet flycheck smex expand-region company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; 关闭工具栏,菜单栏
(menu-bar-mode -1)
(tool-bar-mode -1)
;;设置选中后再次输入模式为替换
(delete-selection-mode 1)
;;高亮当前行
(global-hl-line-mode 1)
;; 关闭文件滑动控件
(scroll-bar-mode -1)
;; 显示行号
(global-linum-mode 1)
;; 更改光标的样式
(setq-default cursor-type 'bar)
;; 关闭备份
(setq make-backup-files nil)
;; 设置字体
(when (member "Cascadia Code" (font-family-list))
  (set-face-attribute 'default nil :font "Cascadia Code-10"))
;;company
(add-hook 'after-init-hook 'global-company-mode)
;;expand-region 
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
;;smex 
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;;flycheck
(global-flycheck-mode)
;;yasnippet
(yas-global-mode 1)
;;主题配置
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'dracula t)
