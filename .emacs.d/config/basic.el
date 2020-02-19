;;; 主界面及透明度
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
(setq inhibit-startup-message t)
(global-hl-line-mode t)
(add-to-list 'default-frame-alist'(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist'(ns-appearance . dark))
(add-to-list 'default-frame-alist'(alpha . (80 . 75)))

;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)
;; 关闭自己生产的保存文件
(setq auto-save-default nil)
;; 关闭自己生产的备份文件
(setq make-backup-files nil)
;; 选中某个区域继续编辑可以替换掉该区域
(delete-selection-mode 1)
;; 设置h 文件默认为c++文件
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
;; 设置主题
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)
;; 设置字体
(set-frame-font "Sarasa Mono SC 14")

(provide 'basic)
