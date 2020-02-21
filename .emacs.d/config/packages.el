(straight-use-package 'ox-hugo)
(use-package ox-hugo
  :after ox)
(straight-use-package 'yasnippet)
(straight-use-package 'yasnippet-snippets)
(use-package yasnippet
  :commands
  (yas-reload-all)
  :init
  (add-hook 'prog-mode-hook #'yas-minor-mode))
;; IVY all
(straight-use-package 'ivy)
(straight-use-package 'counsel)
(straight-use-package 'swiper)
(straight-use-package 'all-the-icons-ivy-rich)
(use-package ivy
  :init
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))
(use-package all-the-icons-ivy-rich
  :init (all-the-icons-ivy-rich-mode 1))
(use-package ivy-rich
  :init (ivy-rich-mode 1))

(straight-use-package 'doom-modeline)
(use-package doom-modeline
  :init (doom-modeline-mode 1))
(provide 'packages)
