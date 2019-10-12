(setq-default cursor-type 'bar)
(setq inhibit-splash-screen t)
(setq make-backup-files nil)
(menu-bar-mode -1)
(tool-bar-mode -1)
(delete-selection-mode 1)
(global-hl-line-mode 1)
(scroll-bar-mode -1)
(global-linum-mode 1)

(when (member "Cascadia Code" (font-family-list))
  (set-face-attribute 'default nil :font "Cascadia Code-10"))

(add-hook 'after-init-hook 'global-company-mode)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-flycheck-mode)

(yas-global-mode 1)

(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-acario-dark t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)
;; or for treemacs users
(setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)
